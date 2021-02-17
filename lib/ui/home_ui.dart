import 'package:fire_starter/controllers/controllers.dart';
import 'package:fire_starter/localizations.dart';
import 'package:fire_starter/services/auth_service.dart';
import 'package:fire_starter/ui/components/widgets/blob.dart';
import 'package:fire_starter/ui/components/widgets/avatar.dart';
import 'package:fire_starter/ui/components/forms/form_vertical_spacing.dart';
import 'package:fire_starter/ui/components/widgets/glass_container.dart';
import 'package:flutter/material.dart';

class HomeUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    final controller = AuthService.to;

    return Blob(
      child: GlassContainer(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 120),
                Avatar(controller.firestoreUser.value),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FormVerticalSpace(),
                    Text('${labels.home.uidLabel}: ${controller.firestoreUser?.value?.uid}', style: TextStyle(fontSize: 16)),
                    FormVerticalSpace(),
                    Text('${labels.home.nameLabel}: ${controller.firestoreUser?.value?.name ?? ''}', style: TextStyle(fontSize: 16)),
                    FormVerticalSpace(),
                    Text('${labels.home.emailLabel}: ${controller.firestoreUser?.value?.email ?? ''}', style: TextStyle(fontSize: 16)),
                    FormVerticalSpace(),
                    Text('${labels.home.phoneLabel}: ${controller.firestoreUser?.value?.phone ?? ''}', style: TextStyle(fontSize: 16)),
                    FormVerticalSpace(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
