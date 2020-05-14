import 'package:flutter/material.dart';
import 'package:flutter_login_stateful/mixins/validation_mixins.dart';
import 'package:flutter_login_stateful/widgets/blue_button.dart';
import 'package:flutter_login_stateful/widgets/email_input.dart';
import 'package:flutter_login_stateful/widgets/password_input.dart';

class LoginScreen extends StatefulWidget {
  @override
  State createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  var showPassword = false;
  var email = "";
  var password = "";

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.fromLTRB(16, 32, 16, 16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              EmailInput(
                validateEmail,
                (value) => email = value,
              ),
              PasswordInput(
                showPassword,
                validatePassword,
                (value) => password = value,
                passwordButtonPressed,
              ),
              Container(margin: EdgeInsets.only(bottom: 16)),
              BlueButton(
                "Submit!",
                submitButtonPressed,
              ),
            ],
          ),
        ),
      );

  void passwordButtonPressed() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  void submitButtonPressed() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      print("Log in with email: $email and password: $password");
    }
  }
}
