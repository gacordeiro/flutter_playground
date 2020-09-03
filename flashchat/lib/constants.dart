import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
  hintText: 'Type you message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2),
  ),
);

BorderRadius kBorderRadius = BorderRadius.circular(32);

const mHorizontalCard = EdgeInsets.symmetric(horizontal: 8);
const mHorizontalDefault = EdgeInsets.symmetric(horizontal: 16);
const mHorizontalLarge = EdgeInsets.symmetric(horizontal: 24);

const mVerticalCard = EdgeInsets.symmetric(vertical: 8);
const mVerticalDefault = EdgeInsets.symmetric(vertical: 16);
const mVerticalLarge = EdgeInsets.symmetric(vertical: 24);
