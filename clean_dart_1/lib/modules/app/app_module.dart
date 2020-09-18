import 'package:clean_dart_1/modules/app/app_widget.dart';
import 'package:clean_dart_1/modules/search/domain/usecases/search_by_term.dart';
import 'package:clean_dart_1/modules/search/external/datasources/github_search_datasource.dart';
import 'package:clean_dart_1/modules/search/infra/repositories/search_repository_impl.dart';
import 'package:clean_dart_1/modules/search/presentation/search_bloc.dart';
import 'package:clean_dart_1/modules/search/presentation/search_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind<Dio>((i) => Dio()),
        Bind((i) => GithubSearchDatasource(i())),
        Bind((i) => SearchRepositoryImpl(i())),
        Bind((i) => SearchByTermImpl(i())),
        Bind((i) => SearchBloc(i())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, __) => SearchPage()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
