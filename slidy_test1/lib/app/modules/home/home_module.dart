import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_test1/app/modules/home/home_page.dart';

import 'home_controller.dart';
import 'other/other_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
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
}
