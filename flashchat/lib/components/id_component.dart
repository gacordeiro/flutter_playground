import 'package:flashchat/components/rounded_button.dart';
import 'package:flashchat/constants.dart';
import 'package:flutter/material.dart';

Widget idComponent({
  @required Function(String) onEmailChanged,
  @required Function(String) onPasswordChanged,
  @required VoidCallback onActionClicked,
  String emailHint = 'Enter your email',
  String passwordHint = 'Enter your password',
  String actionLabel = 'Click',
}) {
  return Scaffold(
    backgroundColor: Colors.white,
    body: Padding(
      padding: mHorizontalLarge,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(height: 200, child: Image.asset('images/logo.png')),
          SizedBox(height: 48),
          TextField(
            onChanged: onEmailChanged,
            decoration: _inputDecoration(emailHint),
          ),
          SizedBox(height: 8),
          TextField(
            onChanged: onPasswordChanged,
            decoration: _inputDecoration(passwordHint),
          ),
          SizedBox(height: 24),
          roundedButton(
            title: 'Register',
            onPressed: () {
              print('Register clicked'); //TODO
            },
          )
        ],
      ),
    ),
  );
}

InputDecoration _inputDecoration(String hintText) => InputDecoration(
      hintText: hintText,
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      border: OutlineInputBorder(borderRadius: kBorderRadius),
      enabledBorder: OutlineInputBorder(
        borderRadius: kBorderRadius,
        borderSide: BorderSide(color: Colors.blueAccent, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: kBorderRadius,
        borderSide: BorderSide(color: Colors.blueAccent, width: 2),
      ),
    );
