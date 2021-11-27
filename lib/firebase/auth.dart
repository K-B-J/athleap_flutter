import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get user {
    return _auth.authStateChanges();
  }

  String userEmail() => _auth.currentUser?.email as String;

  Future signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } catch (e) {
      return e;
    }
  }

  Future signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return null;
    } catch (e) {
      return e;
    }
  }

  Future signOut() async {
    try {
      await _auth.signOut();
      return null;
    } catch (e) {
      return e;
    }
  }
}
