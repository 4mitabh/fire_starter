import 'package:fire_starter/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:fire_starter/localizations.dart';
import 'package:fire_starter/models/models.dart';
import 'package:fire_starter/ui/auth/auth.dart';
import 'package:fire_starter/ui/ui.dart';
import 'package:fire_starter/ui/components/components.dart';

class AuthController extends GetxController {
  static AuthController to = Get.find();
  AppLocalizations_Labels labels;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Rx<User> firebaseUser = Rx<User>();
  Rx<UserModel> firestoreUser = Rx<UserModel>();
  final RxBool admin = false.obs;
  final RxBool waitingForOTP = false.obs;
  String _verificationId;

  @override
  void onReady() async {
    //run every time auth state changes
    ever(firebaseUser, handleAuthChanged);
    firebaseUser.value = await getUser;
    firebaseUser.bindStream(user);
    super.onReady();
  }

  @override
  void onClose() {
    phoneController?.dispose();
    nameController?.dispose();
    otpController?.dispose();
    super.onClose();
  }

  handleAuthChanged(_firebaseUser) async {
    //get user data from firestore
    if (_firebaseUser?.uid != null) {
      firestoreUser.bindStream(await streamFirestoreUser());
      await isAdmin();
    }

    if (_firebaseUser == null) {
      Get.offAll(SignInUI());
    } else {
      Get.offAll(HomeUI());
    }
  }

  // Firebase user one-time fetch
  Future<User> get getUser async => _auth.currentUser;

  // Firebase user a realtime stream
  Stream<User> get user => _auth.authStateChanges();

  //Streams the firestore user from the firestore collection
  Future<Stream<UserModel>> streamFirestoreUser() async {
    print('streamFirestoreUser()');
    var userRecord = await getFirestoreUser();
    if (userRecord != null) {
      return _db.doc('/users/${firebaseUser.value.uid}').snapshots().map((snapshot) => UserModel.fromMap(snapshot.data()));
    }

    return null;
  }

  //get the firestore user from the firestore collection
  Future<UserModel> getFirestoreUser() {
    if (firebaseUser?.value?.uid != null) {
      return _db.doc('/users/${firebaseUser.value.uid}').get().then((documentSnapshot) {
        if (documentSnapshot.exists)
          return UserModel.fromMap(documentSnapshot.data());
        else {
          return _createNewUserFirestore();
        }
      });
    }
    return null;
  }

  //Method to handle user sign in using email and password
  verifyOTP(BuildContext context) async {
    String code = otpController.text.trim();
    GetLogger.to.v('Using OTP $code ');
    final labels = AppLocalizations.of(context);
    showLoadingIndicator();
    try {
      await _auth.signInWithCredential(PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: code,
      ));
      hideLoadingIndicator();
    } catch (error) {
      hideLoadingIndicator();
      Get.snackbar(labels.auth.signInErrorTitle, labels.auth.signInError,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 7),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    }
  }

  //Method to handle user sign in using email and password
  requestOTP(BuildContext context, String phone) async {
    GetLogger.to.v('Sending OTP to $phone ');
    final labels = AppLocalizations.of(context);
    showLoadingIndicator();
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: phone,
          verificationCompleted: (credential) {
            FirebaseAuth.instance.signInWithCredential(credential);
            hideLoadingIndicator();
          },
          timeout: const Duration(seconds: 10),
          verificationFailed: (error) {
            GetLogger.to.e(error);
            hideLoadingIndicator();
            Get.snackbar(labels.auth.signInErrorTitle, labels.auth.signInError, snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 7));
          },
          codeSent: (verificationId, __) {
            waitingForOTP.value = true;
            _verificationId = verificationId;
            Get.snackbar(labels.auth.otpVerificationSentTitle, labels.auth.otpVerificationSent,
                snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 7));
          },
          codeAutoRetrievalTimeout: (_) => hideLoadingIndicator());
      // hideLoadingIndicator();
    } catch (error) {
      hideLoadingIndicator();
      GetLogger.to.e(error);
      waitingForOTP.value = false;
      Get.snackbar(labels.auth.signInErrorTitle, labels.auth.signInError,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 7),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    }
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
    _db.doc('/users/${_firebaseUser.uid}').update(user.toJson());
    update();
  }

  //create the firestore user in users collection
  void _createUserFirestore(UserModel user, User _firebaseUser) {
    _db.doc('/users/${_firebaseUser.uid}').set(user.toJson());
    update();
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

  //check if user is an admin user
  isAdmin() async {
    await getUser.then((user) async {
      DocumentSnapshot adminRef = await _db.collection('admin').doc(user?.uid).get();
      if (adminRef.exists) {
        admin.value = true;
      } else {
        admin.value = false;
      }
      update();
    });
  }

  // Sign out
  Future<void> signOut() {
    nameController.clear();
    phoneController.clear();
    otpController.clear();
    waitingForOTP.value = false;
    return _auth.signOut();
  }

  Future<User> signInWithApple() async {
    final appleIdCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );
    final oAuthProvider = OAuthProvider('apple.com');
    final credential = oAuthProvider.credential(
      idToken: appleIdCredential.identityToken,
      accessToken: appleIdCredential.authorizationCode,
    );
    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    return userCredential.user;
  }

  Future<User> signInWithGoogle() async {
    // Trigger the authentication flow

    await GoogleSignIn().signOut(); // to ensure you can sign in different user.

    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) throw labels.auth.aborted;

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

    // onSocialLogin(userCredential.user);
    return userCredential.user;
  }
}
