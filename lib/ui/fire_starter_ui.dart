import 'package:fire_starter/constants/constants.dart';
import 'package:fire_starter/helpers/helpers.dart';
import 'package:fire_starter/localizations.dart';
import 'package:fire_starter/services/auth_service.dart';
import 'package:fire_starter/services/upgrade_check.dart';
import 'package:fire_starter/ui/auth/auth.dart';
import 'package:fire_starter/ui/ui.dart';
import 'package:fire_starter/ui/upgrade_prompt_ui.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:fire_starter/controllers/controllers.dart';
import 'package:fire_starter/ui/components/components.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

class FireStarterUI extends StatelessWidget {
  final Map<String, Widget Function(BuildContext)> routes;
  FireStarterUI({this.routes = const {}});
  @override
  Widget build(BuildContext context) {
    ThemeController.to.getThemeModeFromStore();
    // AuthService.to.signOut();

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
            builder = (_) => PrereqsUI();
            break;
          case RouteNames.SIGN_IN:
            builder = (_) => SignInUI.builder();
            break;
          // case 'home':
          //   builder = (_) => SignedInHome.builder(settings);
          //   break;
          case RouteNames.UPGRADE:
            builder = (_) => UpgradePromptUI();
            break;
          default:
            print('checking ${path[1]} ${routes[path[1]]} ');
            builder = routes[path[1]] ?? (_) => SignedInHome.builder(settings); //.Text(path[1]);
        }
        return MaterialPageRoute(builder: builder, settings: settings, maintainState: false);
      },
    ));
  }
}
