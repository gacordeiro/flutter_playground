import 'package:clean_dart_1/modules/search/domain/entities/search_exception.dart';
import 'package:clean_dart_1/modules/search/domain/entities/search_result.dart';
import 'package:clean_dart_1/modules/search/domain/repositories/search_repository.dart';
import 'package:clean_dart_1/modules/search/domain/usecases/search_by_term.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../utils/test_extensions.dart';

class SearchRepositoryMock extends Mock implements SearchRepository {}

main() {
  final SearchRepository repository = SearchRepositoryMock();
  final usecase = SearchByTermImpl(repository);

  test('successful search should return a SearchResult list', () async {
    when(repository.search(any))
        .thenAnswer((_) async => Right(<SearchResult>[]));
    final result = await usecase('term');
    expect(result.content, isA<List<SearchResult>>());
  });

  test('unsuccessful should return a SearchFailedException', () async {
    when(repository.search(any))
        .thenAnswer((_) async => Left(SearchFailedException()));
    final result = await usecase('term');
    expect(result.content, isA<SearchFailedException>());
  });

  test('empty search should return a InvalidTermException', () async {
    when(repository.search(any))
        .thenAnswer((_) async => Right(<SearchResult>[]));
    final result = await usecase('');
    expect(result.content, isA<InvalidTermException>());
  });

  test('null search should return a InvalidTermException', () async {
    when(repository.search(any))
        .thenAnswer((_) async => Left(SearchFailedException()));
    final result = await usecase(null);
    expect(result.content, isA<InvalidTermException>());
  });
}
