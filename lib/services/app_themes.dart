import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  ThemeData lightTheme() {
    var theme = FlexColorScheme.light(scheme: _scheme, appBarStyle: FlexAppBarStyle.custom).toTheme;
    return fixFonts(theme, false);
  }

  ThemeData darkTheme() {
    var theme = FlexColorScheme.dark(scheme: _scheme).toTheme;
    return fixFonts(theme, true);
  }

  ThemeData fixFonts(ThemeData theme, bool isDark) {
    return ThemeData.from(colorScheme: theme.colorScheme, textTheme: getTextTheme(theme, isDark));
  }

  getTextTheme(ThemeData theme, bool isDark) {
    ColorScheme colorScheme = theme.colorScheme;
    var textTheme = theme.textTheme.copyWith(
      overline: TextStyle(color: colorScheme.onBackground, fontWeight: FontWeight.w600, fontSize: 6),
      bodyText2: TextStyle(color: colorScheme.onBackground, fontWeight: FontWeight.w600),
      bodyText1: TextStyle(color: colorScheme.onBackground, fontWeight: FontWeight.w600),
      subtitle2: TextStyle(color: colorScheme.onBackground, fontWeight: FontWeight.w600),
      subtitle1: TextStyle(color: colorScheme.onBackground, fontWeight: FontWeight.w600),
      headline6: TextStyle(color: colorScheme.onBackground, fontWeight: FontWeight.w600),
      headline5: TextStyle(color: colorScheme.onBackground, fontWeight: FontWeight.w400),
      headline4: TextStyle(color: colorScheme.onBackground, fontWeight: FontWeight.w200),
      headline3: TextStyle(color: colorScheme.onBackground, fontWeight: FontWeight.w200),
      headline2: TextStyle(color: colorScheme.primary, fontWeight: FontWeight.w200),
      headline1: TextStyle(color: colorScheme.primary, fontWeight: FontWeight.w200),
    );

    return GoogleFonts.quicksandTextTheme(textTheme);
  }
}
