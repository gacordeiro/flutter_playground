import 'package:clean_dart_1/modules/search/presentation/search_bloc.dart';
import 'package:clean_dart_1/modules/search/presentation/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SearchPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<SearchPage> {
  final SearchBloc bloc = Modular.get();

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Github Search')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              onChanged: bloc.add,
              decoration: InputDecoration(
                labelText: 'User',
                hintText: 'enter github user name',
                hintStyle: TextStyle(fontStyle: FontStyle.italic),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: StreamBuilder(
                  stream: bloc,
                  builder: (ctx, _) {
                    final state = bloc.state;

                    if (state is SearchStateStart) {
                      return Center(child: Text('No results'));
                    }

                    if (state is SearchStateLoading) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (state is SearchStateSuccess) {
                      return ListView.builder(
                        itemCount: state.list.length,
                        itemBuilder: (_, index) {
                          final item = state.list[index];
                          return ListTile(
                            title: Text(item.title),
                            subtitle: Text(item.content),
                            leading: CircleAvatar(
                              backgroundImage: item.img.isEmpty
                                  ? Icon(Icons.person)
                                  : NetworkImage(item.img),
                            ),
                          );
                        },
                      );
                    }

                    // else, state is SearchStateError
                    return Center(child: Text('Search failed'));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
