import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_test/models/item_model.dart';

class ItemWidget extends StatelessWidget {
  final ItemModel item;
  final VoidCallback removeClicked;

  ItemWidget(this.item, this.removeClicked);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => ListTile(
        title: Text(item.title),
        leading: Checkbox(
          value: item.check ?? false,
          onChanged: item.setCheck,
        ),
        trailing: IconButton(
          color: Colors.red,
          icon: Icon(Icons.remove_circle),
          onPressed: removeClicked,
        ),
      ),
    );
  }
}
