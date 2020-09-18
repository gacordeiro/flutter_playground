import 'dart:convert';

import 'package:clean_dart_1/modules/app/app_module.dart';
import 'package:clean_dart_1/modules/search/domain/entities/search_result.dart';
import 'package:clean_dart_1/modules/search/domain/repositories/search_repository.dart';
import 'package:clean_dart_1/modules/search/domain/usecases/search_by_term.dart';
import 'package:clean_dart_1/modules/search/external/datasources/github_search_datasource.dart';
import 'package:clean_dart_1/modules/search/infra/datasources/search_datasource.dart';
import 'package:clean_dart_1/modules/search/infra/repositories/search_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../utils/test_extensions.dart';
import '../../resources/github_search_datasource_result.dart';

final responseData = jsonDecode(githubJsonResult);

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();

  initModule(AppModule(), changeBinds: [
    Bind<Dio>((i) => dio),
  ]);

  test('return DioMock when getting a Dio', () {
    final dependency = Modular.get<Dio>();
    expect(dependency, isA<DioMock>());
  });

  test('return GithubSearchDatasource when getting a SearchDatasource', () {
    final dependency = Modular.get<SearchDatasource>();
    expect(dependency, isA<GithubSearchDatasource>());
  });

  test('return SearchRepositoryImpl when getting a SearchRepository', () {
    final dependency = Modular.get<SearchRepository>();
    expect(dependency, isA<SearchRepositoryImpl>());
  });

  test('return SearchByTermImpl when getting a SearchByTerm', () {
    final dependency = Modular.get<SearchByTerm>();
    expect(dependency, isA<SearchByTermImpl>());
  });

  test('should run usecase properly with all injected dependencies', () async {
    when(dio.get(any))
        .thenAnswer((_) async => Response(data: responseData, statusCode: 200));
    final usecase = Modular.get<SearchByTerm>();
    final result = await usecase('term');
    expect(result.content, isA<List<SearchResult>>());
  });
}
