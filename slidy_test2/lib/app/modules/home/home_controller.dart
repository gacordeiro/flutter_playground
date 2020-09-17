import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_test2/app/shared/auth/auth_controller.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  AuthController _auth = Modular.get();

  @action
  void logout() {
    _auth.logout();
    Modular.to.pushReplacementNamed('/login');
  }
}
