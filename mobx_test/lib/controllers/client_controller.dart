import 'package:mobx/mobx.dart';
import 'package:mobx_test/models/client.dart';

part 'client_controller.g.dart';

class ClientController = ClientControllerBase with _$ClientController;

abstract class ClientControllerBase with Store {
  Client client = Client();

  @computed
  bool get isValid {
    return validateName == null && validateEmail == null && validateCpf == null;
  }

  String get validateName {
    if (client.name == null || client.name.isEmpty) {
      return "Please inform a name";
    } else if (client.name.length < 3) {
      return "Name must have at least 3 characters";
    }
    return null;
  }

  String get validateEmail {
    if (client.email == null || client.email.isEmpty) {
      return "Please inform an email";
    } else if (!client.email.contains('@')) {
      return "Email is not valid";
    }
    return null;
  }

  String get validateCpf {
    if (client.cpf == null || client.cpf.isEmpty) {
      return "Please inform a cpf";
    } else if (client.cpf.length < 11) {
      return "Cpf is not valid";
    }
    return null;
  }

  void dispose() {
    print('disposing of ClientController');
  }
}
