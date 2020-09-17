import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  bool isInitialized = false;

  @override
  void initState() {
    super.initState();

    Firebase.initializeApp().whenComplete(
      () => setState(() => isInitialized = true),
    );
  }

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();

    if (!isInitialized) return Center(child: CircularProgressIndicator());

    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: 'Flutter Slidy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
