import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_test1/app/app_widget.dart';
import 'package:slidy_test1/app/pages/home/home_controller.dart';
import 'package:slidy_test1/app/pages/home/home_page.dart';
import 'package:slidy_test1/app/pages/other/other_page.dart';
import 'package:slidy_test1/app/pages/pokemon/poke_controller.dart';
import 'package:slidy_test1/app/pages/pokemon/poke_page.dart';
import 'package:slidy_test1/app/shared/repositories/poke_repository.dart';
import 'package:slidy_test1/app/shared/utils/constants.dart';

import 'app_controller.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => HomeController()),
        Bind((i) => PokeController(i.get())),
        Bind((i) => PokeRepository(i.get())),
        Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE))),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => PokePage()),
        ModularRouter('/home', child: (_, args) => HomePage()),
        ModularRouter(
          '/other/:text',
          child: (_, args) => OtherPage(text: args.params['text']),
        ),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
