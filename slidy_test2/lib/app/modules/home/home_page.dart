import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: controller.logout,
          )
        ],
      ),
      body: Column(
        children: <Widget>[],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.launch),
        onPressed: () => Modular.to.pushNamed('/poke'),
      ),
    );
  }
}
