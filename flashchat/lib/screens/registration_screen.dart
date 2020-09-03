import 'package:flashchat/components/id_component.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  static const id = 'registration_screen';

  @override
  RegistrationScreenState createState() => RegistrationScreenState();
}

class RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return idComponent(
      onEmailChanged: (email) => print('onEmailChanged: $email'),
      onPasswordChanged: (password) => print('onPasswordChanged: $password'),
      onActionClicked: () => print('onActionClicked'),
      actionLabel: 'Register',
      color: Colors.blueAccent,
      heroButtonTag: RegistrationScreen.id,
    );
  }
}
