import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_easy/features/datasources/firestore_datasource.dart';
import 'package:shop_easy/features/providers/firebase_instances_provider.dart';
import 'package:shop_easy/features/repositories/firestore/firestore_repository.dart';
import 'package:shop_easy/features/usecases/firestore/get_creationdate_usecase.dart';
import 'package:shop_easy/features/usecases/firestore/get_username_usecase.dart';

final firestoreDatasourceProvider = Provider(
  (ref) => FirestoreDatasource(
    ref.read(firestoreProvider),
    ref.read(firebaseAuthProvider),
  ),
);

final firestoreRepositoryProvider = Provider(
  (ref) => FirestoreRepository(ref.read(firestoreDatasourceProvider)),
);

final getUsernameUseCaseProvider = Provider(
  (ref) => GetUsernameUsecase(ref.read(firestoreRepositoryProvider)),
);

final getCreationDateUseCaseProvider = Provider(
  (ref) => GetCreationdateUsecase(ref.read(firestoreRepositoryProvider)),
);

final usernameProvider = FutureProvider<String?>((ref) async {
  return ref.read(getUsernameUseCaseProvider).call();
});

final creationDateProvider = FutureProvider<DateTime?>((ref) async {
  return ref.read(getCreationDateUseCaseProvider).call();
});
