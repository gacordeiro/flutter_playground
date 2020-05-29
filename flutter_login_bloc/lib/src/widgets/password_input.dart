import 'package:flutter/material.dart';

import '../blocs/provider.dart';

class PasswordInput extends StatefulWidget {
  @override
  State createState() => PasswordInputState();
}

class PasswordInputState extends State<PasswordInput> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          Expanded(child: _passwordField(context)),
          IconButton(
            icon: Icon(showPassword ? Icons.visibility_off : Icons.visibility),
            color: Colors.grey,
            onPressed: _passwordButtonPressed,
          ),
        ],
      );

  StreamBuilder<String> _passwordField(BuildContext context) => StreamBuilder(
        stream: Provider.of(context).password,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) => TextField(
          obscureText: !showPassword,
          onChanged: Provider.of(context).changePassword,
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
