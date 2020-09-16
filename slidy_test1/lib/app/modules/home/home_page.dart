import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<HomePage> {
  final controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: TextField(
          onChanged: (value) => controller.text = value,
          decoration: InputDecoration(labelText: 'Um texto qualquer'),
        ),
      ),
      floatingActionButton: Observer(
        builder: (_) => FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            if (controller.text.isNotEmpty) {
              Modular.to.pushNamed('/home/other/${controller.text}');
            }
          },
        ),
      ),
    );
  }
}
