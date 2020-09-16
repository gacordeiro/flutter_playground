import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_test1/app/modules/pokemon/poke_controller.dart';
import 'package:slidy_test1/app/modules/pokemon/poke_page.dart';
import 'package:slidy_test1/app/modules/pokemon/poke_repository.dart';


class PokeModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => PokeController(i.get())),
    Bind((i) => PokeRepository(i.get())),
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter(Modular.initialRoute, child: (_, args) => PokePage()),
      ];
}
