import 'package:flutter/material.dart';

class OtherPage extends StatefulWidget {
  final String  text;

  const OtherPage({Key key, this.text}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<OtherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Other')),
      body: Center(
        child: Text(widget.text),
      ),
    );
  }
}
