import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {
  final String text;
  final Function buttonPressed;

  BlueButton(
    this.text,
    this.buttonPressed,
  );

  @override
  Widget build(BuildContext context) => RaisedButton(
        child: Text(text),
        textColor: Colors.white,
        color: Colors.blue,
        onPressed: buttonPressed,
      );
}
