import 'package:flutter/material.dart';
import 'package:news/src/blocs/stories_bloc.dart';
import 'package:news/src/screens/news_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StoriesProvider(
        child: MaterialApp(
          title: "News!",
          home: NewsList(),
        ),
      );
}
