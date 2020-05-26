import 'package:flutter/material.dart';

import '../blocs/Bloc.dart';
import '../widgets/email_input.dart';
import '../widgets/password_input.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            EmailInput(),
            PasswordInput(),
            Container(margin: EdgeInsets.only(bottom: 16)),
            RaisedButton(
              child: Text("Submit!"),
              textColor: Colors.white,
              color: Colors.blue,
              onPressed: () {
                bloc.pressButton(true);
              },
            ),
          ],
        ),
      );

  void passwordButtonPressed() {
    print("passwordButtonPressed"); // TODO
  }

  void submitButtonPressed() {
    print("submitButtonPressed"); // TODO
  }
}
