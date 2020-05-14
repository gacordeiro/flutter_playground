import 'package:flutter/material.dart';

class DatabaseScreen extends StatefulWidget {
  @override
  State createState() => new DatabaseScreenState();
}

class DatabaseScreenState extends State<DatabaseScreen> {
  String _outputText = "...";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Database Playground')),
      backgroundColor: Colors.white,
      body: new Center(child: new Text('$_outputText')),
    );
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      //TODO
    });
  }
}
