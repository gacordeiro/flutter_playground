import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'models.dart';
import 'widgets/image_list.dart';

class App extends StatefulWidget {
  @override
  State createState() => AppState();
}

class AppState extends State<App> {
  List<ImageModel> images = [];

  void fetchImage() async {
    final response = await get("$baseUrl${images.length + 1}");
    final imageModel = ImageModel.fromJson(json.decode(response.body));
    setState(() {
      images.add(imageModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Let's see some images!"),
        ),
        body: ImageList(images),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: fetchImage,
        ),
      ),
    );
  }
}
