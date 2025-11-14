import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_easy/features/datasources/firestore_datasource.dart';

class FirebaseAuthDatasource {
  final FirebaseAuth _firebaseAuth;
  final FirestoreDatasource _firestoreDatasource;

  FirebaseAuthDatasource(this._firebaseAuth, this._firestoreDatasource);

  Future<User?> signInWithEmail(String email, String password) async {
    final result = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return result.user;
  }

  Future<User?> signUpWithEmail(
    String email,
    String username,
    String password,
  ) async {
    try {
      final result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      try {
        await _firestoreDatasource.createUsername(username, result.user!.uid);
      } catch (e) {
        await result.user!.delete();
        rethrow;
      }

      return result.user;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();
}
