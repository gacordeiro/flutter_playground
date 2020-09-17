import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_test2/app/app_widget.dart';
import 'package:slidy_test2/app/modules/home/home_module.dart';
import 'package:slidy_test2/app/modules/login/login_module.dart';
import 'package:slidy_test2/app/modules/pokemon/poke_module.dart';
import 'package:slidy_test2/app/pages/splash/splash_page.dart';
import 'package:slidy_test2/app/shared/auth/auth_controller.dart';
import 'package:slidy_test2/app/shared/auth/auth_repository.dart';
import 'package:slidy_test2/app/shared/utils/constants.dart';

import 'app_controller.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $AppController,
        Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE))),
        Bind<AuthRepository>((i) => AuthRepositoryImpl()),
        Bind((i) => AuthController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => SplashPage()),
        ModularRouter('/home', module: HomeModule()),
        ModularRouter('/login', module: LoginModule()),
        ModularRouter('/poke', module: PokeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
