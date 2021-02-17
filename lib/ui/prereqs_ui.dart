import 'package:fire_starter/services/auth_service.dart';
import 'package:fire_starter/services/upgrade_check.dart';
import 'package:fire_starter/ui/components/widgets/logo_graphic_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrereqsUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    checks();
    return Scaffold(
      body: Container(
        child: Center(
          child: LogoGraphicHeader(),
        ),
      ),
    );
  }

  Future goTo(String path) => Future.delayed(Duration(milliseconds: 10)).then((value) => Get.offAllNamed(path));

  Future checks() {
    if (UpgradeCheckService.check != 0) return goTo('/upgrade');
    if (AuthService.to.firebaseUser?.value?.uid == null) return goTo('/signin');
    return goTo('/home');
  }
}
