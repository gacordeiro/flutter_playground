import 'package:flutter/material.dart';

import '../blocs/Bloc.dart';

class PasswordInput extends StatefulWidget {
  @override
  State createState() => PasswordInputState();
}

class PasswordInputState extends State<PasswordInput> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          Expanded(child: _passwordField()),
          IconButton(
            icon: Icon(showPassword ? Icons.visibility_off : Icons.visibility),
            color: Colors.grey,
            onPressed: _passwordButtonPressed,
          ),
        ],
      );

  StreamBuilder<String> _passwordField() => StreamBuilder(
        stream: bloc.password,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) => TextField(
          obscureText: !showPassword,
          onChanged: bloc.changePassword,
          decoration: InputDecoration(
            labelText: "Password",
            hintText: "Enter your password",
            errorText: snapshot.error,
          ),
        ),
      );

  void _passwordButtonPressed() {
    setState(() {
      showPassword = !showPassword;
    });
  }
}
