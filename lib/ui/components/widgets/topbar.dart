import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:fire_starter/controllers/theme_controller.dart';
import 'package:fire_starter/ui/components/widgets/line_button.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class TopBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final void Function()? onBack;
  final String title;

  TopBar({
    required this.title,
    this.onBack,
    Key? key,
  })  : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: Colors.transparent,
      title: AutoSizeText(title, style: Theme.of(context).textTheme.headline5, maxLines: 1),
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: true,
      leading: (onBack != null)
          ? null
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: LineButton(
                radius: 8,
                padding: 4,
                child: Icon(Icons.chevron_left, color: Theme.of(context).colorScheme.onBackground),
                onPressed: onBack!,
              ),
            ),
    );
  }
}
