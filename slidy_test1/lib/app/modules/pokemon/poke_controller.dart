import 'package:mobx/mobx.dart';
import 'package:slidy_test1/app/modules/pokemon/poke_model.dart';
import 'package:slidy_test1/app/modules/pokemon/poke_repository.dart';

part 'poke_controller.g.dart';

class PokeController = _Base with _$PokeController;

abstract class _Base with Store {
  final PokeRepository repository;

  @observable
  ObservableFuture<List<PokemonModel>> pokemons;

  _Base(this.repository) {
    fetchPokemons();
  }

  @action
  void fetchPokemons() {
    pokemons = repository.getAllPokemons().asObservable();
  }
}
