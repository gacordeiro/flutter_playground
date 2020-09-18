import 'package:clean_dart_1/modules/search/domain/entities/search_exception.dart';
import 'package:clean_dart_1/modules/search/infra/datasources/search_datasource.dart';
import 'package:clean_dart_1/modules/search/infra/models/search_result_model.dart';
import 'package:clean_dart_1/modules/search/infra/repositories/search_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../utils/test_extensions.dart';

class SearchDatasourceMock extends Mock implements SearchDatasource {}

main() {
  final source = SearchDatasourceMock();
  final repository = SearchRepositoryImpl(source);

  test('successful getSearch should return a SearchResultModel list', () async {
    when(source.getSearch(any)).thenAnswer((_) async => <SearchResultModel>[]);
    final result = await repository.search('term');
    expect(result.content, isA<List<SearchResultModel>>());
  });

  test(
      'getSearch with generic exception should return SearchFailedException with generic message',
      () async {
    when(source.getSearch(any)).thenThrow(Exception());
    final result = await repository.search('term');
    final SearchFailedException exception = result.content;
    expect(exception.message, SearchFailedException.defaultMessage);
  });

  test('getSearch with SearchFailedException should forward it', () async {
    when(source.getSearch(any))
        .thenThrow(SearchFailedException(message: 'Specific message'));
    final result = await repository.search('term');
    final SearchFailedException exception = result.content;
    expect(exception.message, 'Specific message');
  });
}
