import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flashchat/app_router.dart';
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

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  bool isInitialized = false;

  @override
  void initState() {
    super.initState();

    Firebase.initializeApp().whenComplete(
      () => setState(() => isInitialized = true),
    );

    _controller = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );
    _animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(_controller);
    _controller.forward();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _animation.value,
      body: Padding(
        padding: mHorizontalLarge,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(),
            SizedBox(height: 48),
            if (isInitialized) _buildLoginButton(context),
            if (isInitialized) _buildRegisterButton(context),
            if (!isInitialized) Center(child: CircularProgressIndicator()),
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
          TypewriterAnimatedTextKit(
            text: ['Flash Chat'],
            textStyle: TextStyle(fontSize: 45, fontWeight: FontWeight.w900),
            speed: const Duration(milliseconds: 250),
            totalRepeatCount: 1,
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
            context.navigateToLogin();
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
            context.navigateToRegistration();
          },
        ),
      );
}
