import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_easy/features/datasources/firebase_auth_datasource.dart';
import 'package:shop_easy/features/datasources/firestore_datasource.dart';
import 'package:shop_easy/features/providers/firebase_instances_provider.dart';
import 'package:shop_easy/features/repositories/auth/auth_repository.dart';
import 'package:shop_easy/features/usecases/auth/auth_state_change_usecase.dart';
import 'package:shop_easy/features/usecases/auth/sign_in_usecase.dart';
import 'package:shop_easy/features/usecases/auth/sign_out_usecase.dart';
import 'package:shop_easy/features/usecases/auth/sign_up_usecase.dart';

final firestoreDatasourceProvider = Provider(
  (ref) => FirestoreDatasource(
    ref.read(firestoreProvider),
    ref.read(firebaseAuthProvider),
  ),
);

final authDatasourceProvider = Provider(
  (ref) => FirebaseAuthDatasource(
    ref.read(firebaseAuthProvider),
    ref.read(firestoreDatasourceProvider),
  ),
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

final authStateChangesUseCaseProvider = Provider(
  (ref) => AuthStateChangeUsecase(ref.read(authRepositoryProvider)),
);

final authStateChangesProvider = StreamProvider(
  (ref) => ref.watch(authStateChangesUseCaseProvider).call()
);
