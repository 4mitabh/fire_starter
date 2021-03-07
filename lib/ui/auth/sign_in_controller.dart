import 'package:fire_starter/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:fire_starter/localizations.dart';
import 'package:fire_starter/services/auth_service.dart';
import 'package:fire_starter/ui/components/components.dart';

class SignInController extends GetxController {
  static SignInController to = Get.find();
  static AuthService _authService = Get.find();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final RxBool waitingForOTP = false.obs;
  String? _verificationId;
  String? phoneNumber;

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    // phoneController?.dispose();
    // nameController?.dispose();
    // otpController?.dispose();
    super.onClose();
  }

  //Method to handle user sign in using email and password
  requestOTP(BuildContext context, String phone) async {
    phoneNumber = phone;
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

  //Method to handle user sign in using email and password
  verifyOTP(BuildContext context) async {
    String code = otpController.text.trim();
    GetLogger.to.v('Using OTP $code ');
    final labels = AppLocalizations.of(context);
    showLoadingIndicator();
    try {
      await _auth.signInWithCredential(PhoneAuthProvider.credential(
        verificationId: _verificationId!,
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

  // Sign out
  Future<void> signOut() {
    nameController.clear();
    phoneController.clear();
    otpController.clear();
    waitingForOTP.value = false;
    return _authService.signOut();
  }

  cancelPhoneVerification() {
    waitingForOTP.value = false;
    otpController.clear();
  }

  Future<User?> signInWithApple() async {
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

  Future<User?> signInWithGoogle() async {
    // Trigger the authentication flow

    await GoogleSignIn().signOut(); // to ensure you can sign in different user.

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return null;

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Create a new credential
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

    // onSocialLogin(userCredential.user);
    return userCredential.user;
  }
}
