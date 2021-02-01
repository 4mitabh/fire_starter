import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:core';
import 'package:get/get.dart';
import 'package:fire_starter/localizations.dart';
import 'package:fire_starter/ui/auth/auth.dart';
import 'package:fire_starter/ui/components/components.dart';
import 'package:fire_starter/helpers/helpers.dart';
import 'package:fire_starter/controllers/controllers.dart';

class SignInUI extends StatelessWidget {
  final AuthController authController = AuthController.to;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  LogoGraphicHeader(),
                  SizedBox(height: 48.0),
                  FormInputFieldWithIcon(
                    controller: authController.phoneController,
                    iconPrefix: Icons.phone,
                    labelText: labels?.auth?.phone,
                    validator: Validator(labels).number,
                    keyboardType: TextInputType.phone,
                    onChanged: (value) => null,
                    onSaved: (value) =>
                        authController.phoneController.text = value,
                  ),
                  FormVerticalSpace(),
                  PrimaryButton(
                      labelText: labels?.auth?.signInButton,
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          authController.signInWithEmailAndPassword(context);
                        }
                      }),
                  FormVerticalSpace(),
                  LabelButton(
                      labelText: labels?.auth?.googleSignIn,
                      onPressed: () async {
                        try {
                          await authController.signInWithGoogle();
                          Get.toNamed('home');
                        } catch (e) {
                          Get.snackbar('Error', e.toString());
                        }
                      }),
                  LabelButton(
                      labelText: labels?.auth?.appleSignIn,
                      onPressed: () async {
                        try {
                          await authController.signInWithApple();
                          Get.toNamed('home');
                        } catch (e) {
                          Get.snackbar('Error', e.toString());
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
