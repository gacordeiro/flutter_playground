import 'package:flashchat/components/rounded_button.dart';
import 'package:flashchat/constants.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: mHorizontalLarge,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(),
            SizedBox(height: 48),
            _buildLoginButton(),
            _buildRegisterButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() => Row(
        children: [
          Container(
            child: Image.asset('images/logo.png'),
            height: 60,
          ),
          Text(
            'Flash Chat',
            style: TextStyle(fontSize: 45, fontWeight: FontWeight.w900),
          ),
        ],
      );

  Widget _buildLoginButton() => roundedButton(
        title: 'Log In',
        onPressed: () {
          print('Log In clicked'); //TODO
        },
      );

  Widget _buildRegisterButton() => roundedButton(
        title: 'Register',
        onPressed: () {
          print('Register clicked'); //TODO
        },
      );
}
