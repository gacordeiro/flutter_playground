import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'config_controller.g.dart';

@Injectable()
class ConfigController = _ConfigControllerBase with _$ConfigController;

abstract class _ConfigControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
