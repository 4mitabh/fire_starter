import 'package:fire_starter/controllers/theme_controller.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton({this.labelText, this.onPressed});

  final String labelText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            color: Colors.transparent,
            child: Center(
                child: Text(
              labelText.toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onPrimary),
            )),
            // decoration: ThemeController.to.appTheme.kInnerDecoration(context),
          ),
        ),
        height: 66.0,
        decoration: ThemeController.to.appTheme.value.kOutlineBoxDecoration(context),
      ),
    );
  }
}
