import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'second_controller.g.dart';

@Injectable()
class SecondController = _SecondControllerBase with _$SecondController;

abstract class _SecondControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
