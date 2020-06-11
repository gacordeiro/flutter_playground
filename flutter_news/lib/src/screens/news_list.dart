import 'package:flutter/material.dart';
import 'package:news/src/blocs/stories_bloc.dart';
import 'package:news/src/widgets/news_list_tile.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);
    bloc.fetchTopIds();
    return Scaffold(
      appBar: AppBar(title: Text("Top News")),
      body: buildList(bloc),
    );
  }

  Widget buildList(StoriesBloc bloc) => StreamBuilder(
        stream: bloc.topIds,
        builder: (context, AsyncSnapshot<List<int>> snapshot) {
          return !snapshot.hasData
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, int index) {
                    final id = snapshot.data[index];
                    bloc.fetchItem(id);
                    return NewsListTile(id);
                  },
                );
        },
      );
}
