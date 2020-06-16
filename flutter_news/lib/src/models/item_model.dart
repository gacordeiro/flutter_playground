import 'dart:convert';

class ItemModel {
  final int id;
  final bool deleted;
  final String type;
  final String by;
  final int time;
  final String text;
  final bool dead;
  final int parent;
  final List<dynamic> kids;
  final String url;
  final int score;
  final String title;
  final int descendants;

  ItemModel.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'],
        deleted = parsedJson['deleted'] ?? false,
        type = parsedJson['type'],
        by = parsedJson['by'],
        time = parsedJson['time'],
        text = parsedJson['text'] ?? "",
        dead = parsedJson['dead'] ?? false,
        parent = parsedJson['parent'],
        kids = parsedJson['kids'] ?? [],
        url = parsedJson['url'],
        score = parsedJson['score'],
        title = parsedJson['title'],
        descendants = parsedJson['descendants'] ?? 0;

  ItemModel.fromDb(Map<String, dynamic> dbMap)
      : id = dbMap['id'],
        deleted = dbMap['deleted'] == 1,
        type = dbMap['type'],
        by = dbMap['by'],
        time = dbMap['time'],
        text = dbMap['text'],
        dead = dbMap['dead'] == 1,
        parent = dbMap['parent'],
        kids = jsonDecode(dbMap['kids']),
        url = dbMap['url'],
        score = dbMap['score'],
        title = dbMap['title'],
        descendants = dbMap['descendants'] ?? 0;

  Map<String, dynamic> mapForDb() => <String, dynamic>{
        'id': id,
        'type': type,
        'by': by,
        'time': time,
        'text': text,
        'parent': parent,
        'url': url,
        'score': score,
        'title': title,
        'descendants': descendants,
        'deleted': deleted ? 1 : 0,
        'dead': deleted ? 1 : 0,
        'kids': jsonEncode(kids),
      };
}
