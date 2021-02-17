import 'package:fire_starter/helpers/helpers.dart';
import 'package:fire_starter/models/metadata_model.dart';
import 'package:get/utils.dart';
import 'package:package_info_plus/package_info_plus.dart';

class UpgradeCheckService {
  static init() async {
    if (GetPlatform.isWeb) _result = 0;
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    MetadataModel metadata = await MetadataModel.get();
    if (metadata == null) return Future.delayed(Duration(seconds: 5)).then((value) => UpgradeCheckService.init());
    int appVersion = int.parse(packageInfo.version.split('.')[0]);
    GetLogger.to.i('Upgrade check: Local ${packageInfo.version} server: $metadata');

    if (metadata.majorVersion < appVersion) return _result = 1;
    int appMinorVersion = int.parse(packageInfo.version.split('.')[1]);
    if (metadata.minorVersion > appMinorVersion) return _result = 2;
    _result = 0;
  }

  static int _result = -1;
  static int get check => _result;

  static void reset() {
    _result = 0;
  }
}
