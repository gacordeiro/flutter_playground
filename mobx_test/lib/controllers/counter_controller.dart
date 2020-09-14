import 'package:mobx/mobx.dart';

part 'counter_controller.g.dart';

class CounterController = CounterControllerBase with _$CounterController;

abstract class CounterControllerBase with Store {
  @observable
  String name = '';

  @observable
  String surname = '';

  @computed
  String get fullName => '$name $surname';

  @action
  changeName(String newName) {
    name = newName;
  }

  @action
  changeSurname(String newSurname) {
    surname = newSurname;
  }
}
