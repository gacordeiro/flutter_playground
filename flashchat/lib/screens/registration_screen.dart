import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashchat/app_router.dart';
import 'package:flashchat/components/id_component.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  static const id = 'registration_screen';
  final _auth = FirebaseAuth.instance;

  Widget build(BuildContext context) {
    return IdWidget(
      actionLabel: 'Register',
      color: Colors.blueAccent,
      heroButtonTag: RegistrationScreen.id,
      authAction: (email, password) async {
        try {
          final newUser = await _auth.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );
          if (newUser != null) context.navigateToChat();
        } catch (e) {
          print(e);
        }
      },
    );
  }
}
