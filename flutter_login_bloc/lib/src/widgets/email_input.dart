import 'package:flutter/material.dart';

import '../blocs/Bloc.dart';

class EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StreamBuilder(
        stream: bloc.email,
        builder: (BuildContext context, AsyncSnapshot snapshot) => TextField(
          keyboardType: TextInputType.emailAddress,
          onChanged: bloc.changeEmail,
          decoration: InputDecoration(
            labelText: "Email Address",
            hintText: "email@host.com",
            errorText: snapshot.error,
          ),
        ),
      );
}
