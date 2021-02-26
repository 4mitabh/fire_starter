import 'package:fire_starter/services/app_themes.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton({this.labelText, this.onPressed});

  final String labelText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          child: Center(
              child: Text(
            labelText.toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary.withAlpha(120)),
          )),
          decoration: AppThemes.to.kInnerDecoration(context),
        ),
      ),
      height: 66.0,
      decoration: AppThemes.to.kGradientBoxDecoration(context),
    );
  }
}
