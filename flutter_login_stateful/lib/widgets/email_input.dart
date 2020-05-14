import 'package:flutter/material.dart';

class EmailInput extends StatelessWidget {
  final Function validateEmail;
  final Function saveEmail;

  EmailInput(
    this.validateEmail,
    this.saveEmail,
  );

  @override
  Widget build(BuildContext context) => TextFormField(
        keyboardType: TextInputType.emailAddress,
        validator: validateEmail,
        onSaved: saveEmail,
        decoration: InputDecoration(
          labelText: "Email Address",
          hintText: "email@host.com",
        ),
      );
}
