import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:slidy_test2/app/shared/auth/auth_repository.dart';

part 'auth_controller.g.dart';

@Injectable()
class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final AuthRepository _repository = Modular.get();

  @observable
  User user;

  @action
  void setUser(User value) {
    user = value;
  }

  _AuthControllerBase() {
    user = _repository.getUser();
  }

  Future<void> login() async {
    user = await _repository.login();
  }

  void logout() {
    user = null;
  }
}
