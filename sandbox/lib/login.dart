import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'storage.dart';

class LoginScreen extends StatefulWidget {
  @override
  State createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = new GoogleSignIn(scopes: ['email']);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Login into SANDBOX'),
      ),
      body: _setupViews(),
    );
  }

  Widget _setupViews() {
    return new Center(
      child: new RaisedButton(child: new Text("LOGIN"), onPressed: _loginPressed),
    );
  }

  void _loginPressed() {
    _handleSignIn().then((FirebaseUser user) => _loginSuccessful(user)).catchError((e) => print(e));
  }

  Future<FirebaseUser> _handleSignIn() async {
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    storeSignInInfo(googleAuth.accessToken, googleAuth.idToken);

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final AuthResult authResult = await _auth.signInWithCredential(credential);

    return authResult.user;
  }

  void _loginSuccessful(FirebaseUser user) {
    //TODO check if any user info is necessary
    print("signed in with " + user.displayName);
    Navigator.of(context).pushReplacementNamed("/home");
  }
}
