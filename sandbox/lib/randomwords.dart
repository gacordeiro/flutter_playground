import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

import 'storage.dart';

final biggerFont = const TextStyle(fontSize: 18.0);
final randomWordsKey = new GlobalKey<RandomWordsState>();

class RandomWords extends StatefulWidget {
  RandomWords({Key key}) : super(key: key);

  @override
  RandomWordsState createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final saved = new Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
          new IconButton(icon: new Icon(Icons.cloud), onPressed: _pushDatabase),
          new IconButton(icon: new Icon(Icons.exit_to_app), onPressed: _logout)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        // The itemBuilder callback is called once per suggested word pairing,
        // and places each suggestion into a ListTile row.
        // For even rows, the function adds a ListTile row for the word pairing.
        // For odd rows, the function adds a Divider widget to visually
        // separate the entries. Note that the divider may be difficult
        // to see on smaller devices.
        itemBuilder: (context, i) {
          // Add a one-pixel-high divider widget before each row in theListView.
          if (i.isOdd) return new Divider();

          // The syntax "i ~/ 2" divides i by 2 and returns an integer result.
          // For example: 1, 2, 3, 4, 5 becomes 0, 1, 1, 2, 2.
          // This calculates the actual number of word pairings in the ListView,
          // minus the divider widgets.
          final index = i ~/ 2;
          // If you've reached the end of the available word pairings...
          if (index >= _suggestions.length) {
            // ...then generate 10 more and add them to the suggestions list.
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            saved.remove(pair);
          } else {
            saved.add(pair);
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context).pushNamed("/saved_words");
  }

  void _pushDatabase() {
    Navigator.of(context).pushNamed("/database");
  }

  void _logout() {
    logout();
    Navigator.of(context).pushReplacementNamed("/login");
  }
}

class SavedWords extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tiles = randomWordsKey.currentState.saved.map(
      (pair) {
        return new ListTile(
          title: new Text(
            pair.asPascalCase,
            style: biggerFont,
          ),
        );
      },
    );

    final divided = ListTile.divideTiles(
      context: context,
      tiles: tiles,
    ).toList();

    return new Scaffold(
      appBar: new AppBar(title: new Text('Saved Suggestions')),
      body: new ListView(children: divided),
    );
  }
}
