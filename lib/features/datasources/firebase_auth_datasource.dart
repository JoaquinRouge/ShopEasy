import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthDatasource {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthDatasource(this._firebaseAuth);

  Future<User?> signInWithEmail(String email, String password) async {
    final result = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return result.user;
  }

  Future<User?> signUpWithEmail(String email, String password) async {
    final result = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return result.user;
  }

  Future<void> signOut() async{
    await _firebaseAuth.signOut();
  }

  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();
}
