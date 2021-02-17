import 'package:fire_starter/helpers/helpers.dart';
import 'package:fire_starter/services/auth_service.dart';
import 'package:fire_starter/services/upgrade_check.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpgradePromptUI extends StatefulWidget {
  UpgradePromptUI();

  @override
  _UpgradePromptUIState createState() => _UpgradePromptUIState();
}

class _UpgradePromptUIState extends State<UpgradePromptUI> {
  @override
  Widget build(BuildContext context) {
    switch (UpgradeCheckService.check) {
      case -1:
        Future.delayed(Duration(seconds: 1)).then((value) => setState(() {}));
        return Material(
          child: SizedBox.expand(
              child: Container(
                  color: Color.fromRGBO(33, 33, 33, 1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: Image(height: 40, image: AssetImage('assets/sync.gif')),
                      ),
                      Text(
                        'Waiting for a network connection...',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ))),
        );
      case 1:
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
                              launch(GetPlatform.isIOS
                                  ? 'https://apps.apple.com/in/app/hyperk/id1475304152'
                                  : 'https://play.google.com/store/apps/details?id=com.enthrall.scorizen')
                            }),
                  ],
                ),
              ),
            ));
      case 2:
        UpgradeCheckService.reset();
        Future.delayed(Duration(seconds: 1)).then((value) {
          showSnackBar('Upgrade Available', 'It is recommended that you update to the latest build');
        });
        Future.delayed(Duration(milliseconds: 1)).then((value) {
          AuthService.to.signinCheck();
        });
        break;
      case 0:
        Future.delayed(Duration(milliseconds: 1)).then((value) {
          AuthService.to.signinCheck();
        });
        break;
    }
    return Container();
  }
}
