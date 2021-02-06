import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_sheet_localization/flutter_sheet_localization.dart';

part 'localizations.g.dart';
//https://docs.google.com/spreadsheets/d/1cwOz3LVDOK4_0JTKt1OcZjH_P8uezPVa68OIU3Swt-M/edit#gid=0
//to rebuild language files
//delete the localizations.g.dart file
//on command line run...
//flutter packages pub run build_runner build  --delete-conflicting-outputs

@SheetLocalization("1cwOz3LVDOK4_0JTKt1OcZjH_P8uezPVa68OIU3Swt-M", "0", 6) // <- Bump versions here
class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => AppLocalizations.languages.containsKey(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
