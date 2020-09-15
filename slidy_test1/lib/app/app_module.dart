import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_test1/app/app_widget.dart';
import 'package:slidy_test1/app/pages/home/home_controller.dart';
import 'package:slidy_test1/app/pages/home/home_page.dart';
import 'package:slidy_test1/app/pages/other/other_page.dart';

import 'app_controller.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => HomeController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => HomePage()),
        ModularRouter(
          '/other/:text',
          child: (_, args) => OtherPage(text: args.params['text']),
        ),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
