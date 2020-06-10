import 'package:flutter/material.dart';
import 'package:news/src/blocs/stories_bloc.dart';

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
        builder: (BuildContext context, AsyncSnapshot<List<int>> snapshot) => !snapshot.hasData
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) => Text(snapshot.data[index].toString()),
              ),
      );
}
