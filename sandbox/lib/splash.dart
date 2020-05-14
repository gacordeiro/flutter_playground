import 'package:flutter/material.dart';

import 'storage.dart';

class SplashScreen extends StatefulWidget {
  @override
  State createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new FlutterLogo(),
    );
  }

  @override
  void initState() {
    super.initState();
    _checkForSignIn();
  }

  void _checkForSignIn() {
    retrieveSignInInfo().then((signInInfo) => _navigateWith(signInInfo)).catchError((e) => _checkForSignInError(e));
  }

  void _navigateWith(SignInInfo signInInfo) {
    if (signInInfo != null) {
      Navigator.of(context).pushReplacementNamed("/home");
    } else {
      Navigator.of(context).pushReplacementNamed("/login");
    }
  }

  void _checkForSignInError(Object error) {
    print(error);
    Scaffold.of(context).showSnackBar(new SnackBar(
      content: new Text("Error retrieving user information"),
    ));
  }
}
