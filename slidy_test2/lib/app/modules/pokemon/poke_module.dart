import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_test2/app/modules/pokemon/poke_controller.dart';
import 'package:slidy_test2/app/modules/pokemon/poke_page.dart';
import 'package:slidy_test2/app/modules/pokemon/poke_repository.dart';


class PokeModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => PokeController(i.get())),
    Bind((i) => PokeRepository(i.get())),
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter('/poke', child: (_, args) => PokePage()),
      ];
}
