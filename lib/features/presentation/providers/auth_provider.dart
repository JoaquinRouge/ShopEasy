import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_easy/features/datasources/firebase_auth_datasource.dart';
import 'package:shop_easy/features/repositories/auth/auth_repository.dart';
import 'package:shop_easy/features/usecases/auth/sign_in_usecase.dart';
import 'package:shop_easy/features/usecases/auth/sign_out_usecase.dart';
import 'package:shop_easy/features/usecases/auth/sign_up_usecase.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final authDatasourceProvider = Provider(
  (ref) => FirebaseAuthDatasource(ref.read(firebaseAuthProvider)),
);

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(ref.read(authDatasourceProvider)),
);

final signInUseCaseProvider = Provider(
  (ref) => SignInUsecase(ref.read(authRepositoryProvider)),
);

final signUpUseCaseProvider = Provider(
  (ref) => SignUpUsecase(ref.read(authRepositoryProvider)),
);

final signOutUseCaseProvider = Provider(
  (ref) => SignOutUsecase(ref.read(authRepositoryProvider)),
);
