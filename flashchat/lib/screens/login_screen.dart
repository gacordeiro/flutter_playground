import 'package:flashchat/components/id_component.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const id = 'login_screen';

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return idComponent(
      onEmailChanged: (email) => print('onEmailChanged: $email'),
      onPasswordChanged: (password) => print('onPasswordChanged: $password'),
      onActionClicked: () => print('onActionClicked'),
      actionLabel: 'Log In',
      color: Colors.lightBlueAccent,
    );
  }
}
