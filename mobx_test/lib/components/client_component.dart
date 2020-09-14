import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_test/controllers/client_controller.dart';
import 'package:provider/provider.dart';

class ClientComponent extends StatelessWidget {
  Widget _textField({
    String labelText,
    String errorText,
    ValueChanged<String> onChanged,
  }) =>
      TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labelText,
          errorText: errorText,
        ),
      );

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ClientController>(context);
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          SizedBox(height: 8),
          Observer(
            builder: (_) => _textField(
              labelText: 'name',
              errorText: controller.validateName,
              onChanged: controller.client.changeName,
            ),
          ),
          SizedBox(height: 16),
          Observer(
            builder: (_) => _textField(
              labelText: 'email',
              errorText: controller.validateEmail,
              onChanged: controller.client.changeEmail,
            ),
          ),
          SizedBox(height: 16),
          Observer(
            builder: (_) => _textField(
              labelText: 'cpf',
              errorText: controller.validateCpf,
              onChanged: controller.client.changeCpf,
            ),
          ),
          SizedBox(height: 16),
          Observer(builder: (_) {
            return RaisedButton(
              onPressed: controller.isValid ? _onPressed : null,
              child: Text('save'),
            );
          }),
        ],
      ),
    );
  }

  void _onPressed() {
    print('click!');
  }
}
