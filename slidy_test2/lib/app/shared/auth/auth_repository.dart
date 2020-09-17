import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  User getUser();

  Future<User> login({String email, String password});
}

class AuthRepositoryImpl implements AuthRepository {
  final _auth = FirebaseAuth.instance;

  @override
  User getUser() {
    return _auth.currentUser;
  }

  @override
  Future<User> login({String email = "q@q.qq", String password = "123456"}) async {
    User user;
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = result.user;
    } catch (e) {
      print(e);
    }
    return user;
  }

  Future<void> logout() => _auth.signOut();
}
