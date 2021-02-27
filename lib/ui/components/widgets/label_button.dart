import 'package:fire_starter/controllers/theme_controller.dart';
import 'package:fire_starter/services/app_themes.dart';
import 'package:flutter/material.dart';

class LabelButton extends StatelessWidget {
  LabelButton({this.labelText, this.onPressed, this.radius, this.child, this.padding = 22});
  final String labelText;
  final double radius;
  final double padding;
  final Widget child;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onPressed,
        child: this.child ??
            Text(
              labelText.toUpperCase(),
            ),

        // color: Theme.of(context).backgroundColor.withAlpha(AppThemes.containerAlpha ~/ 4),
        style: ElevatedButton.styleFrom(
          side: BorderSide(width: 2, color: Theme.of(context).buttonColor.withAlpha(AppTheme.containerAlpha ~/ 2)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(this.radius ?? AppTheme.containerRadius),
          ),
          padding: EdgeInsets.all(this.padding),
        ));
  }
}
