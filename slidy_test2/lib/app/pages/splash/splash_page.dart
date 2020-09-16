import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  final String title;
  final bool shouldDelay;

  const SplashPage({Key key, this.title = "Splash", this.shouldDelay = true})
      : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    if (widget.shouldDelay)
      Future.delayed(const Duration(seconds: 2))
          .then((value) => Modular.to.pushReplacementNamed('/home'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
