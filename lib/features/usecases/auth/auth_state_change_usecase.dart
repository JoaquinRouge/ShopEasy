import 'package:shop_easy/features/entitites/user_entity.dart';
import 'package:shop_easy/features/repositories/auth/i_auth_repository.dart';

class AuthStateChangeUsecase {
  final IAuthRepository repository;

  AuthStateChangeUsecase(this.repository);

  Stream<UserEntity?> call() {
    return repository.authStateChanges();
  }
}
