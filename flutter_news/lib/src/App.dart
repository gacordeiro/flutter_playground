import 'package:flutter/material.dart';
import 'package:news/src/blocs/stories_bloc.dart';
import 'package:news/src/screens/news_detail.dart';
import 'package:news/src/screens/news_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StoriesProvider(
        child: MaterialApp(
          title: "News!",
          onGenerateRoute: (RouteSettings settings) => MaterialPageRoute(
            builder: (context) => routeFor(settings),
          ),
        ),
      );

  Widget routeFor(RouteSettings settings) {
    if (settings.name == "/") {
      return NewsList();
    } else {
      final id = int.parse(settings.name.substring(1));
      return NewsDetail(id);
    }
  }
}
