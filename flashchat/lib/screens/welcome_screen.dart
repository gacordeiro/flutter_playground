import 'package:flashchat/components/rounded_button.dart';
import 'package:flashchat/constants.dart';
import 'package:flashchat/screens/login_screen.dart';
import 'package:flashchat/screens/registration_screen.dart';
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
            _buildLoginButton(context),
            _buildRegisterButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() => Row(
        children: [
          Hero(
            tag: 'logo',
            child: Container(
              child: Image.asset('images/logo.png'),
              height: 60,
            ),
          ),
          Text(
            'Flash Chat',
            style: TextStyle(fontSize: 45, fontWeight: FontWeight.w900),
          ),
        ],
      );

  Widget _buildLoginButton(BuildContext context) => Hero(
    tag: LoginScreen.id,
    child: roundedButton(
          title: 'Log In',
          color: Colors.lightBlueAccent,
          onPressed: () {
            print('Log In clicked');
            Navigator.pushNamed(context, LoginScreen.id);
          },
        ),
  );

  Widget _buildRegisterButton(BuildContext context) => Hero(
    tag: RegistrationScreen.id,
    child: roundedButton(
          title: 'Register',
          color: Colors.blueAccent,
          onPressed: () {
            print('Register clicked');
            Navigator.pushNamed(context, RegistrationScreen.id);
          },
        ),
  );
}
