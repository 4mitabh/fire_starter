import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppThemes extends GetxService {
  static AppThemes to = Get.find();
  // AppThemes._();

  static const int containerAlpha = 100;
  static const double containerRadius = 40;

  BoxDecoration kInnerDecoration(context) {
    return BoxDecoration(
      color: Theme.of(context).buttonColor.withAlpha(12),
      // border: Border.all(color: Colors.white24),
      borderRadius: BorderRadius.circular(32),
    );
  }

  BoxDecoration kGradientBoxDecoration(context) {
    ThemeData theme = Theme.of(context);
    return BoxDecoration(
      gradient: LinearGradient(colors: [theme.backgroundColor.withAlpha(132), theme.backgroundColor.withAlpha(54)]),
      // border: Border.all(
      //   color: Colors.green,
      // ),
      borderRadius: BorderRadius.circular(32),
    );
  }

  static String font1 = "ProductSans";
  static String font2 = "Roboto";
  //constants color range for light theme

  //the light theme
  static final ThemeData lightTheme = FlexColorScheme.light(scheme: FlexScheme.hippieBlue).toTheme;
  static final ThemeData darkTheme = FlexColorScheme.dark(scheme: FlexScheme.mandyRed).toTheme;
}
