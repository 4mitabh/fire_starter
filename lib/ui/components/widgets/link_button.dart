import 'package:fire_starter/controllers/theme_controller.dart';
import 'package:fire_starter/services/app_themes.dart';
import 'package:flutter/material.dart';

class LinkButton extends StatelessWidget {
  LinkButton({this.labelText, required this.onPressed, this.child, this.padding = 8});
  final String? labelText;
  final double padding;
  final Widget? child;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: this.child ??
          Text(
            labelText?.toUpperCase() ?? '',
          ),
    );
  }
}
