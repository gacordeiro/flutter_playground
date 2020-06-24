import 'package:flutter/material.dart';
import 'package:news/src/blocs/stories_bloc.dart';
import 'package:news/src/screens/news_detail.dart';
import 'package:news/src/screens/news_list.dart';

import 'blocs/comments_bloc.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => CommentsProvider(
        child: StoriesProvider(
          child: MaterialApp(
            title: "News!",
            onGenerateRoute: (RouteSettings settings) => MaterialPageRoute(
              builder: (context) => routeFor(context, settings),
            ),
          ),
        ),
      );

  Widget routeFor(BuildContext context, RouteSettings settings) {
    if (settings.name == "/") {
      final bloc = StoriesProvider.of(context);
      bloc.fetchTopIds();
      return NewsList();
    } else {
      final id = int.parse(settings.name.substring(1));
      return NewsDetail(id);
    }
  }
}
