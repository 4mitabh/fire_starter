import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const int containerAlpha = 100;
  static const double containerRadius = 40;
  final FlexScheme _scheme;

  AppTheme(String schemeName) : _scheme = FlexScheme.values.firstWhere((e) => e.toString() == 'FlexScheme.' + schemeName);
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

  BoxDecoration kOutlineBoxDecoration(context) {
    ThemeData theme = Theme.of(context);
    return BoxDecoration(
      gradient: LinearGradient(colors: [theme.primaryColorLight, theme.primaryColorDark]),
      // border: Border.all(
      //   color: Colors.green,
      // ),
      borderRadius: BorderRadius.circular(32),
    );
  }

  static String font1 = "ProductSans";
  static String font2 = "Roboto";
  //constants color range for light theme

  ThemeData lightTheme() => FlexColorScheme.light(scheme: _scheme).toTheme;

  ThemeData darkTheme() => FlexColorScheme.dark(scheme: _scheme).toTheme;
}
