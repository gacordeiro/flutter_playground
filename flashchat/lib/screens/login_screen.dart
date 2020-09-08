import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashchat/app_router.dart';
import 'package:flashchat/components/id_component.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const id = 'login_screen';
  final _auth = FirebaseAuth.instance;

  Widget build(BuildContext context) {
    return IdWidget(
      actionLabel: 'Log In',
      color: Colors.lightBlueAccent,
      heroButtonTag: LoginScreen.id,
      authAction: (email, password) async {
        try {
          final existingUser = await _auth.signInWithEmailAndPassword(
            email: email,
            password: password,
          );
          if (existingUser != null) context.navigateToChat();
        } catch (e) {
          print(e);
        }
      },
    );
  }
}
