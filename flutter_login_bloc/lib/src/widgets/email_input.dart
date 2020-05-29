import 'package:flutter/material.dart';

import '../blocs/provider.dart';

class EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StreamBuilder(
        stream: Provider.of(context).email,
        builder: (BuildContext context, AsyncSnapshot snapshot) => TextField(
          keyboardType: TextInputType.emailAddress,
          onChanged: Provider.of(context).changeEmail,
          decoration: InputDecoration(
            labelText: "Email Address",
            hintText: "email@host.com",
            errorText: snapshot.error,
          ),
        ),
      );
}
