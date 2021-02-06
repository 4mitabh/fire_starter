import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:fire_starter/models/models.dart';
import 'package:fire_starter/localizations.dart';
import 'package:fire_starter/ui/components/components.dart';
import 'package:fire_starter/helpers/helpers.dart';
import 'package:fire_starter/controllers/controllers.dart';
import 'package:fire_starter/ui/auth/auth.dart';

class UpdateProfileUI extends StatelessWidget {
  final AuthController authController = AuthController.to;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    authController.nameController.text = authController?.firestoreUser?.value?.name;
    return Scaffold(
      appBar: AppBar(title: Text(labels.auth.updateProfileTitle)),
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
                    controller: authController.nameController,
                    iconPrefix: Icons.person,
                    labelText: labels.auth.nameFormField,
                    validator: Validator(labels).name,
                    onChanged: (value) => null,
                    onSaved: (value) => authController.nameController.text = value,
                  ),
                  FormVerticalSpace(),
                  PrimaryButton(
                      labelText: labels?.auth?.updateUser,
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          SystemChannels.textInput.invokeMethod('TextInput.hide');
                          UserModel _updatedUser = UserModel(
                              uid: authController?.firestoreUser?.value?.uid,
                              name: authController.nameController.text,
                              photoUrl: authController?.firestoreUser?.value?.photoUrl);
                          authController.updateUser(context, _updatedUser);
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
