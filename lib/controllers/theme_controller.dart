import 'package:fire_starter/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// https://gist.github.com/RodBr/37310335c6639f486bb3c8a628052405
//https://medium.com/swlh/flutter-dynamic-themes-in-3-lines-c3b375f292e3

class ThemeController extends GetxController {
  static ThemeController get to => Get.find();
  final theme = "system".obs;
  final themeName = 'gold'.obs;
  final store = GetStorage();
  final appTheme = AppTheme('gold').obs;
  ThemeMode _themeMode;
  ThemeController() {}

  void onInit() async {
    appTheme(AppTheme(await store.read('theme') ?? themeName.value));
    super.onInit();
  }

  ThemeMode get themeMode => _themeMode;
  String get currentTheme => theme.value;

  Future<void> setThemeMode(String value) async {
    theme.value = value;
    _themeMode = getThemeModeFromString(value);
    Get.changeThemeMode(_themeMode);
    await store.write('themeMode', value);
    update();
  }

  ThemeMode getThemeModeFromString(String themeString) {
    ThemeMode _setThemeMode = ThemeMode.system;
    if (themeString == 'light') {
      _setThemeMode = ThemeMode.light;
    }
    if (themeString == 'dark') {
      _setThemeMode = ThemeMode.dark;
    }
    return _setThemeMode;
  }

  getThemeModeFromStore() async {
    String _themeString = await store.read('themeMode') ?? 'system';
    setThemeMode(_themeString);
  }

  // checks whether darkmode is set via system or previously by user
  bool get isDarkModeOn {
    if (currentTheme == 'system') {
      if (WidgetsBinding.instance.window.platformBrightness == Brightness.dark) {
        return true;
      }
    }
    if (currentTheme == 'dark') {
      return true;
    }
    return false;
  }

  setTheme(String name) {
    themeName(name);
    appTheme(AppTheme(name));
    update();
  }
}
