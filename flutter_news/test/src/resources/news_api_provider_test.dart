import 'package:news/src/resources/news_api_provider.dart';
import 'package:test/test.dart';

import '../test_utils.dart';

void main() {
  test("fetchTopIds returns a list of ids", () async {
    final newsApi = buildApi(body: [1, 2, 3, 4]);
    final ids = await newsApi.fetchTopIds();
    expect(ids, [1, 2, 3, 4]);
  });

  test("fetchItem returns an ItemModel", () async {
    final newsApi = buildApi(body: {'id': 123});
    final item = await newsApi.fetchItem(999);
    expect(item.id, 123);
  });
}

NewsApiProvider buildApi({dynamic body}) {
  final newsApi = NewsApiProvider();
  newsApi.client = clientRespondsWith(body);
  return newsApi;
}
