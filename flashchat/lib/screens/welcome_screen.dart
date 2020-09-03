import 'package:flutter/material.dart';
import '../constants.dart';

class WelcomeScreen extends StatefulWidget {
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

  Widget _buildLoginButton() => _buildButton(
        text: 'Log In',
        click: () {
          print('Log In clicked');
        },
      );

  Widget _buildRegisterButton() => _buildButton(
        text: 'Register',
        click: () {
          print('Register clicked');
        },
      );

  Widget _buildButton({final String text, final VoidCallback click}) => Padding(
        padding: mVerticalDefault,
        child: Material(
          elevation: 4,
          color: Colors.lightBlueAccent,
          borderRadius: BorderRadius.circular(30),
          child: MaterialButton(
            onPressed: click,
            minWidth: 200,
            height: 40,
            child: Text(text),
          ),
        ),
      );
}
