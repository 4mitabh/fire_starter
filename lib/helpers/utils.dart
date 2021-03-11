import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

extension GetLogger on Logger {
  static Logger to = Get.find();
}

Future<String> getCountry() async {
  Logger log = GetLogger.to;
  Duration timeoffset = DateTime.now().timeZoneOffset;
  log.v("Using timeoffset ${DateTime.now().timeZoneOffset} ${DateTime.now().timeZoneName}");
  if (!kIsWeb) log.v(Get.deviceLocale);
  if (timeoffset == Duration(hours: 5, minutes: 30)) {
    log.v('Country from timeoffset India');
    return 'IN';
  }
  if (timeoffset == Duration(hours: 9, minutes: 0)) {
    log.v('Country from timeoffset Japan');
    return 'JP';
  }
  // Extend more locales using timezone here....

  String locale = (Get.deviceLocale.countryCode) ?? 'US';
  if (locale.length >= 5) locale = locale.substring(locale.length - 2, locale.length);
  log.v("Country from locale: $locale");
  if (['IN', 'JP', 'US', 'CA', 'GB'].contains(locale)) return locale;
  return locale;
}

showSnackBar(title, message, {SnackPosition position = SnackPosition.TOP}) => Get.snackbar(title, message,
    snackPosition: position,
    duration: Duration(seconds: 7),
    backgroundColor: Get.theme.snackBarTheme.backgroundColor,
    colorText: Get.theme.snackBarTheme.actionTextColor);
