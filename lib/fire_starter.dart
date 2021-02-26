library firestarter;

import 'dart:async';
import 'package:fire_starter/constants/constants.dart';
import 'package:fire_starter/controllers/controllers.dart';
import 'package:fire_starter/services/auth_service.dart';
import 'package:fire_starter/services/database_service.dart';
import 'package:fire_starter/services/notification.dart';
import 'package:fire_starter/services/package_info.dart';
import 'package:fire_starter/services/upgrade_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

/// FireFlutter
///
/// Recommendation: instantiate `FireFlutter` class into a global variable
/// and use it all over the app runtime.
///
/// Warning: instantiate it after `initFirebase`. One of good places is insdie
/// the first widget loaded by `runApp()` or home screen.
class FireStarter {
  /// [socialLoginHandler] will be invoked when a social login success or fail.
  FireStarter() {
    // print('FireFlutter');
  }

  Future<void> init({
    // String firebaseServerToken,
    Map<String, Map<dynamic, dynamic>> settings,
    // Map<String, Map<String, String>> translations,
  }) async {
    WidgetsFlutterBinding.ensureInitialized();
    Get.put<Logger>(Logger());
    await Firebase.initializeApp();
    await GetStorage.init();
    await PackageInfoService.init();
    Get.put<AppThemes>(AppThemes());
    Get.put<LanguageController>(LanguageController());
    Get.put<ThemeController>(ThemeController());
    Get.put<AuthService>(AuthService());
    Get.put<DatabaseService>(DatabaseService());
    Get.put<NotificationService>(NotificationService());
    UpgradeCheckService.init();

    ThemeController themeController = ThemeController.to;
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      return themeController.setThemeMode(themeController.isDarkModeOn ? 'light' : 'dark');
    });
    // LanguageController languageController = LanguageController.to;
    // Timer.periodic(const Duration(seconds: 13), (Timer timer) {
    //   return languageController.updateLanguage(languageController.currentLanguage == 'en' ? 'hi' : 'en');
    // });
  }
}
