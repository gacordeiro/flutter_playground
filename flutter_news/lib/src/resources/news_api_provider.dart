import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:news/src/models/item_model.dart';
import 'package:news/src/resources/repository.dart';

final _root = "https://hacker-news.firebaseio.com/v0";

class NewsApiProvider implements Source {
  Client client = Client();

  @override
  Future<List<int>> fetchTopIds() async {
    print("NewsApiProvider fetchTopIds()");
    final response = await client.get("$_root/topstories.json");
    final ids = json.decode(response.body).cast<int>();
    return ids;
  }

  @override
  Future<ItemModel> fetchItem(int id) async {
    print("NewsApiProvider fetchItem($id)");
    final response = await client.get("$_root/item/$id.json");
    final parsedJson = json.decode(response.body);
    return ItemModel.fromJson(parsedJson);
  }
}
