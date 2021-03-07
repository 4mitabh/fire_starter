import 'package:fire_starter/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fire_starter/models/models.dart';
import 'package:fire_starter/localizations.dart';
import 'package:fire_starter/ui/components/components.dart';
import 'package:fire_starter/helpers/helpers.dart';

class UpdateProfileUI extends StatelessWidget {
  final AuthService authController = AuthService.to;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();

  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    nameController.text = authController.firestoreUser.value?.name ?? '';
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
                    controller: nameController,
                    iconPrefix: Icons.person,
                    labelText: labels.auth.nameFormField,
                    validator: Validator(labels).name,
                    onChanged: (value) => null,
                    onSaved: (value) => nameController.text = value ?? '',
                  ),
                  FormVerticalSpace(),
                  PrimaryButton(
                      labelText: labels.auth.updateUser,
                      onPressed: () async {
                        if ((_formKey.currentState != null) && _formKey.currentState!.validate()) {
                          SystemChannels.textInput.invokeMethod('TextInput.hide');
                          UserModel _updatedUser =
                              UserModel(id: authController.firestoreUser.value.id, photoUrl: authController.firestoreUser.value?.photoUrl);
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
