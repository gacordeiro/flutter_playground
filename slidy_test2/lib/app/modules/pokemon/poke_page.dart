import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_test2/app/modules/pokemon/poke_controller.dart';

class PokePage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<PokePage> {
  final controller = Modular.get<PokeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Poke!')),
      body: Observer(builder: (_) {
        if (controller.pokemons.error != null) {
          return Center(
            child: RaisedButton(
              child: Text('Error!'),
              onPressed: controller.fetchPokemons,
            ),
          );
        }

        final list = controller.pokemons.value;
        if (list == null) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (_, int index) {
            final model = list[index];
            return ListTile(title: Text(model.name));
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.launch),
        onPressed: () => Modular.to.pushNamed('/home'),
      ),
    );
  }
}
