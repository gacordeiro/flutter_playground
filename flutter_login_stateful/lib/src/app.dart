import 'package:flutter/material.dart';
import 'package:flutter_login_stateful/screens/login_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: "Log Me In Stateful",
        home: Scaffold(
          body: LoginScreen(),
        ),
      );
}
