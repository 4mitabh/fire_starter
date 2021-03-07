import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_starter/constants/constants.dart';
import 'package:fire_starter/helpers/helpers.dart';
import 'package:fire_starter/services/auth_service.dart';
import 'package:fire_starter/services/package_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Background message: ${message.notification?.title} ${message.notification?.body}");
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  _firestore.enableNetwork();
}

class NotificationService extends GetxService {
  static const _NOTIFICATION_TOKEN = 'nt';
  static NotificationService get to => Get.find();
  static FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  String? _uid;
  StreamSubscription? _fcmTokenListener;
  NotificationService() {
    AuthService authService = AuthService.to;
    authService.user.listen(userUpdated);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) showSnackBar(message.notification?.title ?? PackageInfoService.appName, message.notification?.body ?? '');
    });
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  Future<void> _getPermissions() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission();
    if (settings.authorizationStatus != AuthorizationStatus.authorized) {
      showSnackBar('Notificaion', 'Notifications permission is ${settings.authorizationStatus}', position: SnackPosition.TOP);
    }
  }

  FutureOr<void> updateToken(String? token) async {
    if (token == null || _uid == null) return null;
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    DocumentSnapshot userSS = await _firestore.doc('${FirebasePaths.users}/$_uid').get();
    var tokens = userSS.data() != null ? (userSS.data()?[_NOTIFICATION_TOKEN]) : [];
    GetLogger.to.i('Token Updated for $_uid to $token');
    if (tokens == null)
      tokens = [token];
    else if (!tokens.contains(token))
      tokens = [...tokens, token];
    else
      return;
    final box = GetStorage();
    String savedToken = box.read(_NOTIFICATION_TOKEN);
    if (savedToken != null && savedToken != token) {
      GetLogger.to.w('removing old token $savedToken');
      tokens = tokens..removeWhere((t) => t == savedToken);
    }
    box.write(_NOTIFICATION_TOKEN, token);
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    GetLogger.to.i(userSS.reference.path);
    userSS.reference.update({
      _NOTIFICATION_TOKEN: tokens,
      'lastLogin': FieldValue.serverTimestamp(),
      'ts': FieldValue.serverTimestamp(),
      'ver': '${GetPlatform.isIOS ? 'i' : 'a'}.${packageInfo.version}.${packageInfo.buildNumber}'
    });
  }

  Future<void> removeToken() async {
    String token = GetStorage().read(_NOTIFICATION_TOKEN);
    if (token == null) return null;
    GetLogger.to.i('Removing Token: $token');
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    DocumentSnapshot userSS = await _firestore.doc('${FirebasePaths.users}/$_uid').get();
    var tokens = userSS.data()?[_NOTIFICATION_TOKEN];
    if ((tokens == null) || (!tokens.contains(token))) return;
    GetStorage().remove(_NOTIFICATION_TOKEN);
    tokens = tokens..removeWhere((t) => t == token);
    userSS.reference.update({
      _NOTIFICATION_TOKEN: tokens,
      'ts': FieldValue.serverTimestamp(),
    });
  }

  Future<void> userUpdated(User? user) async {
    if (user == null || user.uid == _uid) return;
    _uid = user.uid;
    if (user == null) {
      await removeToken();
      _uid = null;
      _fcmTokenListener?.cancel();
      _fcmTokenListener = null;
      return;
    }

    _getPermissions();
    _firebaseMessaging
        .getToken(vapidKey: "BJBffsstCZH1_qU7CBSoec4_o9J0hLCKVFPpU45ExcXwnJISia8-2i98a5iGk3OPRfNUa07xYge4NQl-SHaA8Ko")
        .then(updateToken);
    _fcmTokenListener = _firebaseMessaging.onTokenRefresh.listen(updateToken);
  }
}
