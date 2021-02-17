import 'package:fire_starter/constants/constants.dart';
import 'package:fire_starter/helpers/helpers.dart';
import 'package:fire_starter/localizations.dart';
import 'package:fire_starter/ui/auth/auth.dart';
import 'package:fire_starter/ui/ui.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:fire_starter/controllers/controllers.dart';
import 'package:fire_starter/ui/components/components.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

class FireStarterUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeController.to.getThemeModeFromStore();
    return Loading(
        //begin language translation stuff //https://github.com/aloisdeniel/flutter_sheet_localization
        child: GetMaterialApp(
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en', 'US'),
      localizationsDelegates: [
        const AppLocalizationsDelegate(), // <- Your custom delegate
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.languages.keys.toList(), // <- Supported locales
      //end language translation stuff
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.system,
      // home: StreamBuilder(stream: authcontorller.user, builder: (_, user) => (user?.data?.uid == null) ? SignInUI() : SignedInHome.builder()),
      initialRoute: "/",
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: FirebaseAnalytics()),
      ],
      onGenerateRoute: (settings) {
        GetLogger.to.i('Navigating to: ${settings.name}');
        List<String> path = settings.name.split('/');
        Widget Function(BuildContext) builder;
        switch (path[1]) {
          case '':
            builder = (_) => SplashUI();
            break;
          case 'signin':
            builder = (_) => SignInUI.builder();
            break;
          case 'home':
            builder = (_) => SignedInHome.builder(settings);
            break;
          default:
            builder = (_) => Text(path[0]);
        }
        return MaterialPageRoute(
          builder: builder,
          settings: settings,
        );
      },
    ));
  }
}
