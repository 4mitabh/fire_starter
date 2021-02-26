import 'package:fire_starter/controllers/controllers.dart';
import 'package:fire_starter/localizations.dart';
import 'package:fire_starter/services/auth_service.dart';
import 'package:fire_starter/ui/components/widgets/glass/blob.dart';
import 'package:fire_starter/ui/components/widgets/avatar.dart';
import 'package:fire_starter/ui/components/forms/form_vertical_spacing.dart';
import 'package:fire_starter/ui/components/widgets/glass/glass.dart';
import 'package:flutter/material.dart';

class HomeUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    final authService = AuthService.to;

    return Blob(
      child: Glass(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 120),
                Avatar(authService.firestoreUser.value),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FormVerticalSpace(),
                    Text('${labels.home.uidLabel}: ${authService.firestoreUser?.value?.uid}', style: TextStyle(fontSize: 16)),
                    FormVerticalSpace(),
                    Text('${labels.home.nameLabel}: ${authService.firestoreUser?.value?.name ?? ''}', style: TextStyle(fontSize: 16)),
                    FormVerticalSpace(),
                    Text('${labels.home.emailLabel}: ${authService.firestoreUser?.value?.email ?? ''}', style: TextStyle(fontSize: 16)),
                    FormVerticalSpace(),
                    Text('${labels.home.phoneLabel}: ${authService.firestoreUser?.value?.phone ?? ''}', style: TextStyle(fontSize: 16)),
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
