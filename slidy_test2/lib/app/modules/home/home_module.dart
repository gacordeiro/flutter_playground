import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';
import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $HomeController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          '/home',
          child: (_, args) => HomePage(),
          transition: TransitionType.fadeIn,
        ),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
