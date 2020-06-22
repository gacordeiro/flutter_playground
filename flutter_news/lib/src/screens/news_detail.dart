import 'package:flutter/material.dart';

class NewsDetail extends StatelessWidget {
  final int id;

  NewsDetail(this.id);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Details for: $id"),
        ),
        body: Center(
          child: Text("X"),
        ),
      );
}
