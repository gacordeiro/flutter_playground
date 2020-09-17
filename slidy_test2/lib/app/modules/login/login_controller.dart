import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_test2/app/shared/auth/auth_controller.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  AuthController _auth = Modular.get();

  @observable
  bool loading = false;

  @action
  Future<void> login() async {
    loading = true;
    await _auth.login();
    loading = false;
    Modular.to.pushReplacementNamed('/home');
  }
}
