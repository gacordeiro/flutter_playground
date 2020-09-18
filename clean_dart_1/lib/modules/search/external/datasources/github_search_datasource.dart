import 'package:clean_dart_1/modules/search/domain/entities/search_exception.dart';
import 'package:clean_dart_1/modules/search/infra/datasources/search_datasource.dart';
import 'package:clean_dart_1/modules/search/infra/models/search_result_model.dart';
import 'package:clean_dart_1/modules/utils/format_extensions.dart';
import 'package:dio/dio.dart';

class GithubSearchDatasource implements SearchDatasource {
  final Dio dio;

  GithubSearchDatasource(this.dio);

  @override
  Future<List<SearchResultModel>> getSearch(String term) async {
    final request = "https://api.github.com/search/users?q=${term.normalized}";
    print("getSearch: $request");
    final response = await dio.get(request);
    if (response.statusCode == 200) {
      return (response.data['items'] as List)
          .map((e) => SearchResultModel.fromMap(e))
          .toList();
    }
    throw SearchFailedException(message: 'getSearch failed: $response');
  }
}
