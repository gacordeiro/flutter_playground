import 'package:flutter/material.dart';
import 'package:news/src/blocs/stories_bloc.dart';
import 'package:news/src/models/item_model.dart';
import 'package:news/src/widgets/title_container.dart';

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
        ? TileContainer.skeleton()
        : FutureBuilder(future: snapshot.data[itemId], builder: loadingItemBuilder);
  }

  Widget loadingItemBuilder(context, AsyncSnapshot<ItemModel> snapshot) {
    return !snapshot.hasData
        ? TileContainer.skeleton()
        : TileContainer(
            Text(snapshot.data.title),
            Text("${snapshot.data.score} votes"),
            Text("${snapshot.data.descendants}"),
            () => Navigator.pushNamed(context, '/${snapshot.data.id}'),
          );
  }
}
