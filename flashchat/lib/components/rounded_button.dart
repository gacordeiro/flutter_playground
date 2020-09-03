import 'package:flashchat/constants.dart';
import 'package:flutter/material.dart';

Widget roundedButton({
  @required VoidCallback onPressed,
  String title = 'Click',
  Color color = Colors.lightBlueAccent,
}) {
  return Padding(
    padding: mVerticalDefault,
    child: Material(
      elevation: 4,
      color: color,
      borderRadius: kBorderRadius,
      child: MaterialButton(
        onPressed: onPressed,
        minWidth: 200,
        height: 40,
        child: Text(title),
      ),
    ),
  );
}
