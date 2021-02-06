import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:core';
import 'package:get/get.dart';
import 'package:fire_starter/localizations.dart';
import 'package:fire_starter/ui/auth/auth.dart';
import 'package:fire_starter/ui/components/components.dart';
import 'package:fire_starter/helpers/helpers.dart';
import 'package:fire_starter/controllers/controllers.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:logger/logger.dart';

class SignInUI extends StatelessWidget {
  final AuthController authController = AuthController.to;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getCountry(),
          builder: (context, snapshot) {
            return Obx(() => buildForm(context, snapshot.data));
          }),
    );
  }

  Form buildForm(BuildContext context, String country) {
    final labels = AppLocalizations.of(context);
    return Form(
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
                if (!authController.waitingForOTP.value)
                  InternationalPhoneNumberInput(
                    onInputChanged: (PhoneNumber number) {
                      // print(number.phoneNumber);
                    },
                    onInputValidated: (bool valid) {},
                    selectorConfig: SelectorConfig(
                      selectorType: PhoneInputSelectorType.DIALOG,
                    ),
                    ignoreBlank: true,
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    // selectorTextStyle: TextStyle(color: Colors.black),
                    textFieldController: authController.phoneController,
                    formatInput: true,
                    countries: ['IN', 'US', 'CA', 'JP'],
                    // keyboardType: TextInputType.numberWithOptions(
                    //     signed: true, decimal: false),
                    inputBorder: OutlineInputBorder(),
                    initialValue: PhoneNumber(isoCode: country),
                    onSaved: (PhoneNumber number) {
                      print('On Saved: $number');
                      authController.requestOTP(context, number.toString());
                    },
                    // maxLength: 16,
                    spaceBetweenSelectorAndTextField: 0,
                  )
                else
                  FormInputFieldWithIcon(
                    controller: authController.otpController,
                    iconPrefix: Icons.vpn_key,
                    labelText: labels?.auth?.enterOTP,
                    // validator: Validator(labels).number,
                    keyboardType: TextInputType.phone,
                    onChanged: (value) => null,
                    onSaved: (value) => authController.phoneController.text = value,
                  ),
                FormVerticalSpace(),
                if (!authController.waitingForOTP.value)
                  PrimaryButton(
                      labelText: labels?.auth?.requestOTP,
                      onPressed: () {
                        if (_formKey.currentState.validate()) _formKey.currentState.save();
                      })
                else
                  PrimaryButton(
                      labelText: labels?.auth?.signInButton,
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          authController.verifyOTP(context);
                        }
                      }),
                FormVerticalSpace(),
                if (GetPlatform.isAndroid)
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
                if (GetPlatform.isMacOS || GetPlatform.isIOS)
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
    );
  }
}
