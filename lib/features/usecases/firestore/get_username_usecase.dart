import 'package:shop_easy/features/repositories/firestore/firestore_repository.dart';

class GetUsernameUsecase {
  final FirestoreRepository firestoreRepository;

  GetUsernameUsecase(this.firestoreRepository);

  Future<String?> call() async {
    return firestoreRepository.getUsername();
  }
}
