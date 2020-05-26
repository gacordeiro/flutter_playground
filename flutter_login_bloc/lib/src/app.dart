import 'package:flutter/material.dart';

import 'screens/LoginScreen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: "Log Me In BLoC",
        home: Scaffold(
          body: LoginScreen(),
        ),
      );
}
