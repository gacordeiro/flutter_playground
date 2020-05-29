import 'dart:async';

import '../mixins/validation_mixins.dart';

class Bloc with ValidationMixin {
  final _email = StreamController<String>.broadcast();
  final _password = StreamController<String>.broadcast();
  final _buttonPressed = StreamController<bool>.broadcast();

  Stream<String> get email => _email.stream.asBroadcastStream().transform(emailValidator);

  Stream<String> get password => _password.stream.asBroadcastStream().transform(passwordValidator);

  Stream<bool> get buttonPressed => _buttonPressed.stream.asBroadcastStream();

  Function(String) get changeEmail => _email.sink.add;

  Function(String) get changePassword => _password.sink.add;

  Function(bool) get pressButton => _buttonPressed.sink.add;

  void dispose() {
    _email.close();
    _password.close();
    _buttonPressed.close();
  }
}
