import 'package:shop_easy/features/entitites/user_entity.dart';
import 'package:shop_easy/features/repositories/auth/i_auth_repository.dart';

class SignUpUsecase {
  final IAuthRepository repository;

  SignUpUsecase(this.repository);

  Future<UserEntity?> call(String email,String username, String password) async {
    return await repository.signUp(email,username,password);
  }
}