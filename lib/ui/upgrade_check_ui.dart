import 'package:fire_starter/helpers/helpers.dart';
import 'package:fire_starter/models/metadata_model.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class UpgradeCheckUI extends StatefulWidget {
  final Widget Function() builder;
  UpgradeCheckUI(this.builder);

  @override
  _UpgradeCheckUIState createState() => _UpgradeCheckUIState();
}

class _UpgradeCheckUIState extends State<UpgradeCheckUI> {
  PackageInfo packageInfo;
  MetadataModel metadata;
  bool _checkComplete = false;
  @override
  void initState() {
    super.initState();
    PackageInfo.fromPlatform().then((value) => setState(() => {packageInfo = value}));
    MetadataModel.get().then((value) => setState(() => {metadata = value}));
  }

  @override
  Widget build(BuildContext context) {
    if (GetPlatform.isWeb || _checkComplete) return widget.builder();

    if (packageInfo == null) return WidgetsApp(builder: (c, w) => Center(child: Text('OFFLINE')), color: Colors.white);
    if (packageInfo.version == null) return widget.builder();

    if (metadata == null)
      return WidgetsApp(
          color: Colors.white,
          builder: (c, w) => SizedBox.expand(
              child: Container(
                  color: Color.fromRGBO(33, 33, 33, 1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: Image(height: 40, image: AssetImage('assets/sync.gif')),
                      ),
                      Text('Waiting for a network connection.')
                    ],
                  ))));
    int cloudVersion = metadata.majorVersion;
    int appVersion = int.parse(packageInfo.version.split('.')[0]);
    GetLogger.to.v('App version :$appVersion, server version: $cloudVersion');
    if (appVersion < cloudVersion)
      return MaterialApp(
          title: 'HyPerk',
          debugShowCheckedModeBanner: false,
          home: new Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Upgrade Required',
                    style: TextStyle(fontSize: 32),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'This will take less than a minuite.',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  MaterialButton(
                      elevation: 2,
                      color: Colors.greenAccent,
                      child: Text('Upgrade'),
                      shape: StadiumBorder(),
                      onPressed: () => {
                            // launch(GetPlatform.isIOS
                            //     ? 'https://apps.apple.com/in/app/hyperk/id1475304152'
                            //     : 'https://play.google.com/store/apps/details?id=com.enthrll.hyperk')
                          }),
                ],
              ),
            ),
          ));
    if (appVersion == cloudVersion && int.parse(packageInfo.version.split('.')[1]) < metadata.minorVersion) {
      GetLogger.to.v('App minor version :${metadata.minorVersion}, server minor version: ${packageInfo.version.split('.')[1]}');
      Future.delayed(Duration(seconds: 5))
          .then((value) => showSnackBar('Upgrade Available', 'It is recommended that you update to the latest build'));
    }
    _checkComplete = true;
    return widget.builder();
  }
}
