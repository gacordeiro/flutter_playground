import 'package:mobx/mobx.dart';

part 'reaction_counter_controller.g.dart';

class ReactionCounterController = _Impl with _$ReactionCounterController;

abstract class _Impl with Store {
  @observable
  int counter = 0;

  @action
  void increment() => counter++;

  @computed
  bool get isEven => counter % 2 == 0;
}
