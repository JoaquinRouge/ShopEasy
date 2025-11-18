import 'package:rxdart/transformers.dart';
import 'package:shop_easy/features/datasources/firebase_auth_datasource.dart';
import 'package:shop_easy/features/datasources/firestore_datasource.dart';
import 'package:shop_easy/features/entitites/user_entity.dart';
import 'package:shop_easy/features/repositories/auth/i_auth_repository.dart';

class AuthRepository extends IAuthRepository {
  FirebaseAuthDatasource authDatasource;
  FirestoreDatasource firestoreDatasource;

  AuthRepository(this.authDatasource, this.firestoreDatasource);

  @override
  Future<UserEntity?> signIn(String email, String password) async {
    final user = await authDatasource.signInWithEmail(email, password);

    return UserEntity(id: user!.uid, email: user.email!, username: "");
  }

  @override
  Future<UserEntity?> signUp(
    String email,
    String username,
    String password,
  ) async {
    final user = await authDatasource.signUpWithEmail(
      email,
      username,
      password,
    );

    return UserEntity(id: user!.uid, email: user.email!, username: "");
  }

  @override
  Future<void> signOut() async {
    await authDatasource.signOut();
  }

  @override
  Stream<UserEntity?> authStateChanges() {
    return authDatasource.authStateChanges().switchMap((firebaseUser) {
      if (firebaseUser == null) {
        return Stream.value(null);
      }

      final username = firestoreDatasource.getCurrentUsername();

      return Stream.fromFuture(username).map((username) {
      // 5. Mapeamos y construimos el UserEntity completo
      return UserEntity(id: firebaseUser.uid, email: firebaseUser.email!, username: username!);
    });
    });
  }
}
