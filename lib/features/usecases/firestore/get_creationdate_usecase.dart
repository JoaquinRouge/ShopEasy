import 'package:shop_easy/features/repositories/firestore/firestore_repository.dart';

class GetCreationdateUsecase {
  final FirestoreRepository repository;

  GetCreationdateUsecase(this.repository);

  Future<DateTime?> call() async {
    return repository.getCreationDate();
  }
}
