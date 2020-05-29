import 'package:flutter/material.dart';

import '../widgets/email_input.dart';
import '../widgets/password_input.dart';
import '../widgets/submit_button.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            EmailInput(),
            PasswordInput(),
            Container(margin: EdgeInsets.only(bottom: 16)),
            SubmitButton(),
          ],
        ),
      );
}
