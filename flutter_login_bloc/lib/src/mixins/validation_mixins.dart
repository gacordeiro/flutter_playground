import 'dart:async';

class ValidationMixin {
  String validateEmail(String email) => (!email.contains("@")) ? "Invalid email!" : null;

  String validatePassword(String password) => (password.length < 6) ? "Invalid password!" : null;

  final emailValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      if (email.contains("@")) {
        sink.add(email);
      } else {
        sink.addError("Enter a valid email!");
      }
    },
  );

  final passwordValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (password.length < 6) {
        sink.addError("Enter a valid password!");
      } else {
        sink.add(password);
      }
    },
  );
}
