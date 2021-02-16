import 'package:fire_starter/ui/components/widgets/logo_graphic_header.dart';
import 'package:flutter/material.dart';

class SplashUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: LogoGraphicHeader(),
        ),
      ),
    );
  }
}
