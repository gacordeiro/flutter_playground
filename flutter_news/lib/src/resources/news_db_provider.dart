import 'dart:io';

import 'package:news/src/models/item_model.dart';
import 'package:news/src/resources/repository.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class NewsDbProvider implements Source, Cache {
  Database db;

  NewsDbProvider() {
    init();
  }

  void init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, "items.db");
    db = await openDatabase(
      path,
      version: 1,
      onCreate: initialDbSetup,
    );
  }

  void initialDbSetup(Database newDb, int version) {
    final createTable = """
      CREATE TABLE Items (
        id INTEGER PRIMARY KEY,
        type TEXT,
        by TEXT,
        time INTEGER,
        text TEXT,
        parent INTEGER,
        kids BLOB,
        dead INTEGER,
        deleted INTEGER,
        url TEXT,
        score INTEGER,
        title TEXT,
        descendants INTEGER
      )
      """;
    newDb.execute(createTable);
  }

  @override
  Future<List<int>> fetchTopIds() {
    print("NewsDbProvider fetchTopIds()");
    return Future.value(<int>[]);
  }

  @override
  Future<ItemModel> fetchItem(int id) async {
    print("NewsDbProvider fetchItem($id)");
    final maps = await db.query(
      "Items",
      columns: null,
      where: "id = ?",
      whereArgs: [id],
    );
    return maps.length > 0 ? ItemModel.fromDb(maps.first) : null;
  }

  @override
  Future<int> addItem(ItemModel item) {
    print("NewsDbProvider addItem(${item.id})");
    db.insert(
      "Items",
      item.mapForDb(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }
}
