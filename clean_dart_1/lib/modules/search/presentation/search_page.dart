import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Github Search')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'User',
                hintText: 'enter github user name',
                hintStyle: TextStyle(fontStyle: FontStyle.italic),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemBuilder: (_, id) {
                  return ListTile();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
