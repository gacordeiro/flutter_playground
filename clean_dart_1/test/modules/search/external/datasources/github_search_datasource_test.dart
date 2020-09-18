import 'dart:convert';

import 'package:clean_dart_1/modules/search/domain/entities/search_exception.dart';
import 'package:clean_dart_1/modules/search/external/datasources/github_search_datasource.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../resources/github_search_datasource_result.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  final source = GithubSearchDatasource(dio);

  test('successful getSearch should complete the future', () {
    final responseData = jsonDecode(githubJsonResult);
    when(dio.get(any))
        .thenAnswer((_) async => Response(data: responseData, statusCode: 200));
    final futureResult = source.getSearch('term');
    expect(futureResult, completes);
  });

  test('unsuccessful getSearch should throw SearchFailedException', () {
    when(dio.get(any)).thenAnswer((_) async => Response(statusCode: 401));
    final futureResult = source.getSearch('term');
    expect(futureResult, throwsA(isA<SearchFailedException>()));
  });

  test('exception on getSearch should throw the Exception', () {
    when(dio.get(any)).thenThrow(Exception());
    final futureResult = source.getSearch('term');
    expect(futureResult, throwsA(isA<Exception>()));
  });
}
