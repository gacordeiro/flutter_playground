import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_test/components/client_component.dart';
import 'package:mobx_test/controllers/client_controller.dart';
import 'package:provider/provider.dart';

class ClientPage extends StatefulWidget {
  @override
  _ClientPageState createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ClientController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Observer(
          builder: (_) => Text(
            controller.isValid ? 'Client is valid' : 'Client is NOT valid',
          ),
        ),
      ),
      body: ClientComponent(),
    );
  }
}
