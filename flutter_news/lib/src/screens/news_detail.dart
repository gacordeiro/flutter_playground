import 'package:flutter/material.dart';
import 'package:news/src/blocs/comments_bloc.dart';
import 'package:news/src/models/item_model.dart';
import 'package:news/src/widgets/title_container.dart';

class NewsDetail extends StatelessWidget {
  final int itemId;

  NewsDetail(this.itemId);

  @override
  Widget build(BuildContext context) {
    final bloc = CommentsProvider.of(context);
    bloc.fetchItemWithComments(itemId);
    return Scaffold(
      appBar: AppBar(
        title: Text("Details for: $itemId"),
      ),
      body: StreamBuilder(
        stream: bloc.itemWithComments,
        builder: futureDetailsBuilder,
      ),
    );
  }

  Widget buildBody(CommentsBloc bloc) {
    return StreamBuilder(
      stream: bloc.itemWithComments,
      builder: futureDetailsBuilder,
    );
  }

  Widget futureDetailsBuilder(context, AsyncSnapshot<Map<int, Future<ItemModel>>> cacheSnapshot) {
    return !cacheSnapshot.hasData
        ? skeleton()
        : FutureBuilder(
            future: cacheSnapshot.data[itemId],
            builder: (context, AsyncSnapshot<ItemModel> itemSnapshot) {
              return !itemSnapshot.hasData ? skeleton() : buildDetails(itemSnapshot.data, cacheSnapshot.data);
            },
          );
  }

  Widget buildDetails(ItemModel item, Map<int, Future<ItemModel>> cache) {
    return ListView(
      children: <Widget>[
        buildTitle(item),
        comments(),
      ],
    );
  }

  Widget buildTitle(ItemModel item) {
    return Container(
      margin: EdgeInsets.all(16),
      alignment: Alignment.topCenter,
      child: Text(
        item.title,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget comments({bool isLoading = false}) => Container(
        margin: EdgeInsets.all(16),
        child: Text(
          "Comments",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: isLoading ? Colors.grey[300] : Colors.black,
          ),
        ),
      );

  Widget skeleton() => ListView(
        children: <Widget>[
          Container(margin: EdgeInsets.all(16), child: Skeleton.title()),
          comments(isLoading: true),
          TileContainer.skeleton(),
          Container(margin: EdgeInsets.only(left: 24), child: TileContainer.skeleton()),
          Container(margin: EdgeInsets.only(left: 48, bottom: 24), child: TileContainer.skeleton()),
        ],
      );
}
