import 'package:flutter/material.dart';
import 'package:news/src/blocs/comments_bloc.dart';
import 'package:news/src/models/item_model.dart';

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
        builder: futureCommentBuilder,
      ),
    );
  }

  Widget buildBody(CommentsBloc bloc) {
    return StreamBuilder(
      stream: bloc.itemWithComments,
      builder: futureCommentBuilder,
    );
  }

  Widget futureCommentBuilder(context, AsyncSnapshot<Map<int, Future<ItemModel>>> snapshot) {
    return !snapshot.hasData
        ? Center(child: CircularProgressIndicator())
        : FutureBuilder(future: snapshot.data[itemId], builder: loadingItemBuilder);
  }

  Widget loadingItemBuilder(context, AsyncSnapshot<ItemModel> snapshot) {
    return !snapshot.hasData ? Center(child: CircularProgressIndicator()) : buildTitle(snapshot.data);
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
}
