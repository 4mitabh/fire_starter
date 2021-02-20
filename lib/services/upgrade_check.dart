import 'package:fire_starter/helpers/helpers.dart';
import 'package:fire_starter/models/metadata_model.dart';
import 'package:fire_starter/services/package_info.dart';
import 'package:get/utils.dart';

class UpgradeCheckService {
  static init() async {
    if (GetPlatform.isWeb) _result = 0;
    MetadataModel metadata = await MetadataModel.get();
    if (metadata == null) return Future.delayed(Duration(seconds: 5)).then((value) => UpgradeCheckService.init());
    int appVersion = PackageInfoService.majorVersion;
    GetLogger.to.i('Upgrade check: Local ${PackageInfoService.majorVersion} server: $metadata');

    if (metadata.majorVersion < appVersion) return _result = 1;
    int appMinorVersion = PackageInfoService.minorVersion;
    if (metadata.minorVersion > appMinorVersion) return _result = 2;
    _result = 0;
  }

  static int _result = -1;
  static int get check => _result;

  static void reset() {
    _result = 0;
  }
}
