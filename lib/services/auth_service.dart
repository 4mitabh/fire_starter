import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../models/models.dart';
import 'package:fire_starter/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:fire_starter/localizations.dart';
import 'package:fire_starter/models/models.dart';
import 'package:fire_starter/ui/components/components.dart';

class AuthService extends GetxService {
  static AuthService to = Get.find();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Rx<User> firebaseUser = Rx<User>();
  Rx<UserModel> firestoreUser = Rx<UserModel>();

  // Firebase user one-time fetch
  Future<User> get getFirebaseUser async => _auth.currentUser;

  // Firebase user a realtime stream
  Stream<User> get user => _auth.authStateChanges();

  @override
  void onReady() async {
    //run every time auth state changes
    ever(firebaseUser, handleAuthChanged);
    firebaseUser.value = await getFirebaseUser;
    firebaseUser.bindStream(user);
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  handleAuthChanged(_firebaseUser) async {
    //get user data from firestore
    if (_firebaseUser?.uid != null) {
      firestoreUser.bindStream(await streamFirestoreUser());
    }
    Get.toNamed('/');
    // if (_firebaseUser == null) {
    //   Get.toNamed('/signin');
    // } else {
    //   Get.toNamed('/home');
    // }
  }

  //Streams the firestore user from the firestore collection
  Future<Stream<UserModel>> streamFirestoreUser() async {
    print('streamFirestoreUser()');
    var userRecord = await getFirestoreUser();
    if (userRecord != null) {
      return _db.doc('${FirebasePaths.users}/${firebaseUser.value.uid}').snapshots().map((snapshot) => UserModel.fromMap(snapshot.data()));
    }

    return null;
  }

  //get the firestore user from the firestore collection
  Future<UserModel> getFirestoreUser() {
    if (firebaseUser?.value?.uid != null) {
      return _db.doc('${FirebasePaths.users}/${firebaseUser.value.uid}').get().then((documentSnapshot) {
        if (documentSnapshot.exists)
          return UserModel.fromMap(documentSnapshot.data());
        else {
          return _createNewUserFirestore();
        }
      });
    }
    return null;
  }

  //handles updating the user when updating profile
  Future<void> updateUser(BuildContext context, UserModel user) async {
    final labels = AppLocalizations.of(context);
    try {
      User _firebaseUser = firebaseUser?.value;
      _updateUserFirestore(user, _firebaseUser);
      hideLoadingIndicator();
      Get.snackbar(labels.auth.updateUserSuccessNoticeTitle, labels.auth.updateUserSuccessNotice,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 5),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    } on PlatformException catch (error) {
      //List<String> errors = error.toString().split(',');
      // print("Error: " + errors[1]);
      hideLoadingIndicator();
      print(error.code);
      Get.snackbar(labels.auth.unknownError, error.code,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 10),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    }
  }

  //updates the firestore user in users collection
  void _updateUserFirestore(UserModel user, User _firebaseUser) {
    _db.doc('${FirebasePaths.users}/${_firebaseUser.uid}').update(user.toJson());
  }

  //create the firestore user in users collection
  void _createUserFirestore(UserModel user, User _firebaseUser) {
    _db.doc('${FirebasePaths.users}/${_firebaseUser.uid}').set(user.toJson());
  }

  UserModel _createNewUserFirestore() {
    User _firebaseUser = firebaseUser?.value;
    UserModel _newUser = UserModel(
      uid: _firebaseUser.uid,
      email: _firebaseUser.email,
      name: _firebaseUser.displayName,
      photoUrl: _firebaseUser.photoURL,
      phone: _firebaseUser.phoneNumber,
    );
    //create the user in firestore
    _createUserFirestore(_newUser, _firebaseUser);
    return _newUser;
  }

  // Sign out
  Future<void> signOut() async {
    firestoreUser(null);
    firebaseUser(null);
    await Future.delayed(Duration(seconds: 2));
    return _auth.signOut();
  }
}
