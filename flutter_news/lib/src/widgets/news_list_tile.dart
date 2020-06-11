import 'package:flutter/material.dart';
import 'package:news/src/blocs/stories_bloc.dart';
import 'package:news/src/models/item_model.dart';

class NewsListTile extends StatelessWidget {
  final int itemId;

  NewsListTile(this.itemId);

  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);
    return StreamBuilder(
      stream: bloc.items,
      builder: futureItemBuilder,
    );
  }

  Widget futureItemBuilder(context, AsyncSnapshot<Map<int, Future<ItemModel>>> snapshot) {
    return !snapshot.hasData
        ? textTile("Stream still loading...")
        : FutureBuilder(
            future: snapshot.data[itemId],
            builder: loadingItemBuilder,
          );
  }

  Widget loadingItemBuilder(context, AsyncSnapshot<ItemModel> snapshot) {
    return !snapshot.hasData
        ? textTile("Still loading item $itemId")
        : textTile(
            snapshot.data.title,
          );
  }

  Widget textTile(String message) => Padding(
        padding: EdgeInsets.all(16),
        child: Text(message),
      );
}
