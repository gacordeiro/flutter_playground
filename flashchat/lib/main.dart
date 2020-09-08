import 'package:flashchat/app_router.dart';
import 'package:flutter/material.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: initialAppRoute,
      routes: appRoutes,
    );
  }
}
