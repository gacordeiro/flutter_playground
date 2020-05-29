import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../mixins/validation_mixins.dart';

class Bloc with ValidationMixin {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  Stream<String> get email => _email.stream.transform(emailValidator);

  Stream<String> get password => _password.stream.transform(passwordValidator);

  Stream<bool> get enableButton => CombineLatestStream.combine2(email, password, (e, p) => true).asBroadcastStream();

  Function(String) get changeEmail => _email.sink.add;

  Function(String) get changePassword => _password.sink.add;

  void submit() {
    final validEmail = _email.value;
    final validPassword = _password.value;
    print("submitButtonPressed! email = $validEmail and password = $validPassword");
  }

  void dispose() {
    _email.close();
    _password.close();
  }
}
