import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_easy/features/repositories/auth/i_auth_repository.dart';

class AuthStateChangeUsecase {
  final IAuthRepository repository;

  AuthStateChangeUsecase(this.repository);

  Stream<User?> call() {
    return repository.authStateChanges();
  }
}
