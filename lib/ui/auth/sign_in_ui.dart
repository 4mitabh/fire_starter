import 'package:fire_starter/services/package_info.dart';

import 'sign_in_controller.dart';
import 'package:fire_starter/ui/components/widgets/blob.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:core';
import 'package:get/get.dart';
import 'package:fire_starter/localizations.dart';
import 'package:fire_starter/ui/components/components.dart';
import 'package:fire_starter/helpers/helpers.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:logger/logger.dart';

class SignInUI extends StatelessWidget {
  static Widget builder([RouteSettings routeSettings]) =>
      GetBuilder<SignInController>(init: SignInController(), builder: (controller) => SignInUI(controller));

  SignInUI(this._signInController);
  final SignInController _signInController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(body: Blob(child: Obx(() => buildForm(context))));
  }

  Form buildForm(BuildContext context) {
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
                Text(PackageInfoService.appName,
                    textAlign: TextAlign.center, style: TextStyle(fontSize: 38, fontWeight: FontWeight.w100, color: Colors.white)),
                LogoGraphicHeader(),
                SizedBox(height: 48.0),
                if (!_signInController.waitingForOTP.value)
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
                    textFieldController: _signInController.phoneController,
                    formatInput: true,
                    countries: ['IN', 'US', 'CA', 'JP'],
                    // keyboardType: TextInputType.numberWithOptions(
                    //     signed: true, decimal: false),
                    inputBorder: OutlineInputBorder(),
                    initialValue: PhoneNumber(isoCode: PackageInfoService.country),
                    onSaved: (PhoneNumber number) {
                      print('On Saved: $number');
                      _signInController.requestOTP(context, number.toString());
                    },
                    // maxLength: 16,
                    spaceBetweenSelectorAndTextField: 0,
                  )
                else
                  FormInputFieldWithIcon(
                    controller: _signInController.otpController,
                    iconPrefix: Icons.vpn_key,
                    labelText: labels?.auth?.enterOTP,
                    // validator: Validator(labels).number,
                    keyboardType: TextInputType.phone,
                    onChanged: (value) => null,
                    onSaved: (value) => _signInController.phoneController.text = value,
                  ),
                FormVerticalSpace(),
                if (!_signInController.waitingForOTP.value)
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
                          _signInController.verifyOTP(context);
                        }
                      }),
                FormVerticalSpace(),
                if (!_signInController.waitingForOTP.value && GetPlatform.isAndroid)
                  LabelButton(
                      labelText: labels?.auth?.googleSignIn,
                      onPressed: () async {
                        try {
                          await _signInController.signInWithGoogle();
                          // Get.toNamed('home');
                        } catch (e) {
                          Get.snackbar('Error', e.toString());
                        }
                      }),
                if (!_signInController.waitingForOTP.value && (GetPlatform.isMacOS || GetPlatform.isIOS))
                  LabelButton(
                      labelText: labels?.auth?.appleSignIn,
                      onPressed: () async {
                        try {
                          await _signInController.signInWithApple();
                          // Get.toNamed('home');
                        } catch (e) {
                          Get.snackbar('Error', e.toString());
                        }
                      }),
                if (_signInController.waitingForOTP.value)
                  LabelButton(
                      labelText: labels?.auth?.otpVerificationChangeNumber(phone: _signInController.phoneNumber),
                      onPressed: () => _signInController.cancelPhoneVerification()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
