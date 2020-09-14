import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../controllers/counter_controller.dart';

class CounterPage extends StatelessWidget {
  final CounterController controller = CounterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MobX Test"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Name'),
                onChanged: controller.changeName,
              ),
              SizedBox(height: 24),
              TextField(
                decoration: InputDecoration(labelText: 'Surname'),
                onChanged: controller.changeSurname,
              ),
              SizedBox(height: 24),
              Observer(
                builder: (_) => Text('${controller.fullName}'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('click'),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
