import 'package:fire_starter/controllers/theme_controller.dart';
import 'package:fire_starter/services/app_themes.dart';
import 'package:flutter/material.dart';

class LabelButton extends StatelessWidget {
  LabelButton({this.labelText, this.onPressed});
  final String labelText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onPressed,
        child: Text(
          labelText.toUpperCase(),
        ),

        // color: Theme.of(context).backgroundColor.withAlpha(AppThemes.containerAlpha ~/ 4),
        style: ElevatedButton.styleFrom(
          side: BorderSide(width: 2, color: Theme.of(context).buttonColor.withAlpha(AppTheme.containerAlpha ~/ 2)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.containerRadius),
          ),
          padding: EdgeInsets.all(22),
        ));
  }
}
