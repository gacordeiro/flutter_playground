import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_test/components/item_widget.dart';
import 'package:mobx_test/controllers/list_controller.dart';
import 'package:mobx_test/models/item_model.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final controller = ListController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: controller.setFilter,
          decoration: InputDecoration(hintText: 'Search'),
        ),
        actions: [
          IconButton(
            icon: Observer(builder: (_) => Text("${controller.totalChecked}")),
            onPressed: () {},
          )
        ],
      ),
      body: Observer(
        builder: (_) => ListView.builder(
          itemCount: controller.filteredList.length,
          itemBuilder: (_, index) {
            final item = controller.filteredList[index];
            return ItemWidget(item, () => controller.removeItem(item));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _dialog,
      ),
    );
  }

  void _dialog() {
    var model = ItemModel();

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text('Add item'),
          content: TextField(
            onChanged: model.setTitle,
            decoration: const InputDecoration(
                border: const OutlineInputBorder(), labelText: 'New Item'),
          ),
          actions: [
            FlatButton(
              onPressed: () {
                controller.addItem(model);
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
