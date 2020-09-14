import 'package:mobx/mobx.dart';

part 'client.g.dart';

class Client = _ClientBase with _$Client;

abstract class _ClientBase with Store {
  @observable
  String name;

  @action
  void changeName(String newValue) => name = newValue;

  @observable
  String email;

  @action
  void changeEmail(String newValue) => email = newValue;

  @observable
  String cpf;

  @action
  void changeCpf(String newValue) => cpf = newValue;
}
