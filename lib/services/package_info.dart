import 'package:fire_starter/helpers/helpers.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PackageInfoService {
  static String appName = '';
  static String packageName = '';
  static int minorVersion = 0;
  static int majorVersion = 0;
  static String buildNumber = '0.0.0';
  static String country = 'US';

  static init() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    majorVersion = int.parse(packageInfo.version.split('.')[0]);
    minorVersion = int.parse(packageInfo.version.split('.')[1]);
    buildNumber = packageInfo.buildNumber;
    packageName = packageInfo.packageName;
    appName = packageInfo.appName;
    country = await getCountry();
  }
}
