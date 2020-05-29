import 'package:flutter/material.dart';

import '../blocs/provider.dart';

class SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StreamBuilder(
        stream: Provider.of(context).enableButton,
        builder: (BuildContext context, AsyncSnapshot snapshot) => RaisedButton(
          child: Text("Submit!"),
          textColor: Colors.white,
          color: Colors.blue,
          onPressed: !snapshot.hasData ? null : () => Provider.of(context).submit(),
        ),
      );
}
