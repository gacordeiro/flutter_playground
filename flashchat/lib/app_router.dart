import 'package:flashchat/screens/chat_screen.dart';
import 'package:flashchat/screens/login_screen.dart';
import 'package:flashchat/screens/registration_screen.dart';
import 'package:flashchat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

const initialAppRoute = WelcomeScreen.id;
final Map<String, WidgetBuilder> appRoutes = {
  ChatScreen.id: (context) => ChatScreen(),
  LoginScreen.id: (context) => LoginScreen(),
  RegistrationScreen.id: (context) => RegistrationScreen(),
  WelcomeScreen.id: (context) => WelcomeScreen(),
};

extension AppRouter on BuildContext {
  void navigateToChat() {
    Navigator.pushNamedAndRemoveUntil(this, ChatScreen.id, (r) => false);
  }

  void navigateToLogin() {
    Navigator.pushNamed(this, LoginScreen.id);
  }

  void navigateToRegistration() {
    Navigator.pushNamed(this, RegistrationScreen.id);
  }

  void navigateToWelcome() {
    Navigator.pushNamedAndRemoveUntil(this, WelcomeScreen.id, (r) => false);
  }
}
