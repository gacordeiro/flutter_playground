import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_test3/app/modules/start/submodules/home/pages/second/second_page.dart';

import 'home_controller.dart';
import 'home_page.dart';
import 'pages/second/second_controller.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $SecondController,
        $HomeController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
        ModularRouter('/second', child: (_, args) => SecondPage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
