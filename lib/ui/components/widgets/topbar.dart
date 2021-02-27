import 'dart:ui';
import 'package:fire_starter/controllers/theme_controller.dart';
import 'package:fire_starter/ui/components/widgets/label_button.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class TopBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final Function onBack;
  final String title;

  TopBar({
    this.title,
    this.onBack,
    Key key,
  })  : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: Colors.transparent,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline5,
      ),
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: true,
      leading: (onBack == null)
          ? null
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: LabelButton(
                radius: 8,
                padding: 4,
                child: Icon(Icons.chevron_left, color: Theme.of(context).colorScheme.onBackground),
                onPressed: onBack,
              ),
            ),
    );
  }
}
