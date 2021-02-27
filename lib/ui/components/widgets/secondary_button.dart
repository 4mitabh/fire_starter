import 'package:fire_starter/controllers/theme_controller.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  SecondaryButton({this.labelText, this.onPressed});
  final String labelText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    var appTheme = ThemeController.to.appTheme.value;
    return InkWell(
      onTap: onPressed,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            child: Center(
                child: Text(
              labelText.toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary.withAlpha(120)),
            )),
            decoration: appTheme.kInnerDecoration(context),
          ),
        ),
        height: 66.0,
        decoration: appTheme.kGradientBoxDecoration(context),
      ),
    );
  }
}
