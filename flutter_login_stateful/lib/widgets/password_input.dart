import 'package:flutter/material.dart';

class PasswordInput extends StatelessWidget {
  final bool showPassword;
  final Function validatePassword;
  final Function savePassword;
  final Function passwordButtonPressed;

  PasswordInput(
    this.showPassword,
    this.validatePassword,
    this.savePassword,
    this.passwordButtonPressed,
  );

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          Expanded(child: _passwordField()),
          IconButton(
            icon: Icon(showPassword ? Icons.visibility_off : Icons.visibility),
            color: Colors.grey,
            onPressed: passwordButtonPressed,
          ),
        ],
      );

  Widget _passwordField() => TextFormField(
        obscureText: !showPassword,
        validator: validatePassword,
        onSaved: savePassword,
        decoration: InputDecoration(
          labelText: "Password",
          hintText: "Enter your password",
        ),
      );
}
