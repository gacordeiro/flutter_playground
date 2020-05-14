class ValidationMixin {
  String validateEmail(String email) => (!email.contains("@")) ? "Invalid email!" : null;

  String validatePassword(String password) => (password.length < 6) ? "Invalid password!" : null;
}
