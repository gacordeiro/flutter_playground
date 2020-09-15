import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_test/components/item_widget.dart';
import 'package:mobx_test/controllers/stream_list_controller.dart';
import 'package:mobx_test/models/item_model.dart';

class StreamListPage extends StatefulWidget {
  @override
  _StreamListPageState createState() => _StreamListPageState();
}

class _StreamListPageState extends State<StreamListPage> {
  final controller = StreamListController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: controller.setFilter,
          decoration: InputDecoration(hintText: 'Stream Search'),
        ),
        actions: [
          IconButton(
            icon: Observer(builder: (_) => Text("${controller.totalChecked}")),
            onPressed: () {},
          )
        ],
      ),
      body: Observer(builder: (_) {
        if (controller.output.data == null) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.output.data.length,
          itemBuilder: (_, index) {
            final item = controller.output.data[index];
            return ItemWidget(item, () => controller.removeItem(item));
          },
        );
      }),
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
          title: Text('Add Stream Item'),
          content: TextField(
            onChanged: model.setTitle,
            decoration: const InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'New Stream Item'),
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
