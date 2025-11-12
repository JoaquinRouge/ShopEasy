import 'package:shop_easy/features/entitites/user_entity.dart';
import 'package:shop_easy/features/repositories/auth/i_auth_repository.dart';

class SignInUsecase {
  final IAuthRepository repository;

  SignInUsecase(this.repository);

  Future<UserEntity?> call(String email, String password) async {
    return await repository.signIn(email, password);
  }
}
