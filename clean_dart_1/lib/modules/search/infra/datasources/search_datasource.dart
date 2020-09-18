import 'package:clean_dart_1/modules/search/infra/models/search_result_model.dart';

abstract class SearchDatasource {
  Future<List<SearchResultModel>> getSearch(String term);
}
