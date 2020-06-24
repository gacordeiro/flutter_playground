import 'package:news/src/models/item_model.dart';

import 'news_api_provider.dart';

final NewsApiProvider _apiProvider = NewsApiProvider();

class Repository {
  List<Source> sources = <Source>[_apiProvider];
  List<Cache> caches = <Cache>[];

  Future<List<int>> fetchTopIds() async {
    List<int> ids;

    for (Source source in sources) {
      ids = await source.fetchTopIds();
      if (ids.length > 0) break;
    }
    return ids;
  }

  Future<ItemModel> fetchItem(int id) async {
    ItemModel item;
    var source;

    for (source in sources) {
      item = await source.fetchItem(id);
      if (item != null) break;
    }

    for (var cache in caches) {
      if (cache != source) cache.addItem(item);
    }
    return item;
  }

  clearCache() async {
    for (var cache in caches) {
      await cache.clear();
    }
  }
}

abstract class Source {
  Future<List<int>> fetchTopIds();

  Future<ItemModel> fetchItem(int id);
}

abstract class Cache {
  Future<int> addItem(ItemModel item);

  Future<int> clear();
}
