import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _authentication = FirebaseAuth.instance;
  Future<UserCredential> Login(String email, String password) async {
    return await _authentication.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
   Future<UserCredential> signup(String email, String password) async {
    return await _authentication.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> Logout() async {
    _authentication.signOut();
  }
}
