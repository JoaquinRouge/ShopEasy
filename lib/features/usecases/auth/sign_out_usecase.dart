import 'package:shop_easy/features/repositories/auth/i_auth_repository.dart';

class SignOutUsecase {
  final IAuthRepository repository;

  SignOutUsecase(this.repository);

  Future<void> call() async {
    return await repository.signOut();
  }
}