import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_easy/features/entitites/user_entity.dart';

abstract class IAuthRepository {
  Future<UserEntity?> signIn(String email, String password);
  Future<UserEntity?> signUp(String email,String username, String password);
  Future<void> signOut();
  Stream<User?> authStateChanges();
}
