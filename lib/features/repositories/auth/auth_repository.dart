import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_easy/features/datasources/firebase_auth_datasource.dart';
import 'package:shop_easy/features/entitites/user_entity.dart';
import 'package:shop_easy/features/repositories/auth/i_auth_repository.dart';

class AuthRepository extends IAuthRepository {
  FirebaseAuthDatasource datasource;

  AuthRepository(this.datasource);

  @override
  Future<UserEntity?> signIn(String email, String password) async {
    final user = await datasource.signInWithEmail(email, password);

    return UserEntity(id: user!.uid, email: user.email!, username: "");
  }

  @override
  Future<UserEntity?> signUp(
    String email,
    String username,
    String password,
  ) async {
    final user = await datasource.signUpWithEmail(email, username, password);

    return UserEntity(id: user!.uid, email: user.email!, username: "");
  }

  @override
  Future<void> signOut() async {
    await datasource.signOut();
  }

  @override
  Stream<User?> authStateChanges() {
    return datasource.authStateChanges();
  }
}
