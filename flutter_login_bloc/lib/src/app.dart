import 'package:flutter/material.dart';

import 'blocs/provider.dart';
import 'screens/login_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Provider(
        child: MaterialApp(
          title: "Log Me In BLoC",
          home: Scaffold(
            body: LoginScreen(),
          ),
        ),
      );
}
