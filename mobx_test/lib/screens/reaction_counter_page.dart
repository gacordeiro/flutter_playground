import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_test/controllers/reaction_counter_controller.dart';

class ReactionCounterPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<ReactionCounterPage> {
  final controller = ReactionCounterController();
  List<ReactionDisposer> disposers;

  @override
  void initState() {
    disposers = [
      reaction<bool>(
        (_) => controller.isEven,
        (isEven) {
          if (isEven)
            Flushbar(
              title: 'Click!',
              message: "It's even!",
              duration: Duration(milliseconds: 700),
            ).show(context);
        },
      ),
      when(
        (_) => controller.counter >= 7,
        () => Flushbar(
          title: 'Click!',
          message: "LUCKY SEVEN!",
          duration: Duration(milliseconds: 700),
        ).show(context),
      ),
      autorun((_) => print('is even? ${controller.isEven}')),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MobX Reactions')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Observer(
              builder: (_) =>
                  Text('You have clicked ${controller.counter} times.'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    disposers.forEach((disposer) => disposer.reaction.dispose());
    super.dispose();
  }
}
