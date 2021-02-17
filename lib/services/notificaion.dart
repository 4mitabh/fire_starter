import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_starter/constants/globals.dart';
import 'package:fire_starter/helpers/helpers.dart';
import 'package:fire_starter/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';

class NotificaionService extends GetxService {
  static const _NOTIFICATION_TOKEN = 'nt';
  static NotificaionService get to => Get.find();
  static FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  String _uid;
  StreamSubscription _fcmTokenListener;
  NotificaionService() {
    AuthService authService = AuthService.to;
    authService.user.listen(userUpdated);
  }
  // static FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //  DocumentReference get tokenDoc =>
  //     db.collection('meta').doc('user').collection('token').doc(user.uid);

  Future<void> _getPermissions() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission();
    if (settings.authorizationStatus != AuthorizationStatus.authorized) {
      Get.snackbar('Notificaion', 'Notifications permission is ${settings.authorizationStatus}',
          snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 7));
    }
  }

  Future<void> updateToken(String token) async {
    if (token == null || _uid == null) return null;
    GetLogger.to.i('Update Token: $token');
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    DocumentSnapshot userSS = await _firestore.doc('${FirebasePaths.users}/$_uid').get();
    var tokens = userSS.data() != null ? userSS.data()[_NOTIFICATION_TOKEN] : [];
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
    String token = await _firebaseMessaging.getToken();
    if (token == null) return null;
    GetLogger.to.i('Removing Token: $token');
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    DocumentSnapshot userSS = await _firestore.doc('${FirebasePaths.users}/$_uid').get();
    var tokens = userSS.data()[_NOTIFICATION_TOKEN];
    if ((tokens == null) || (!tokens.contains(token))) return;
    GetStorage().remove(_NOTIFICATION_TOKEN);
    tokens = tokens..removeWhere((t) => t == token);
    userSS.reference.update({
      _NOTIFICATION_TOKEN: tokens,
      'ts': FieldValue.serverTimestamp(),
    });
  }

  Future<void> userUpdated(User user) async {
    GetLogger.to.i('User Updated : ${user.uid}');
    if (user.uid == _uid) return;
    _uid = user.uid;
    if (user == null) {
      await removeToken();
      _uid = null;
      _fcmTokenListener.cancel();
      _fcmTokenListener = null;
      return;
    }

    _getPermissions();
    _firebaseMessaging.getToken().then(updateToken);
    _fcmTokenListener = _firebaseMessaging.onTokenRefresh.listen(updateToken);
  }
}
