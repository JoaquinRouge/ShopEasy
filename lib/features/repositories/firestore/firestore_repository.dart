import 'package:shop_easy/features/datasources/firestore_datasource.dart';
import 'package:shop_easy/features/repositories/firestore/i_firestore_repository.dart';

class FirestoreRepository extends IFirestoreRepository {
  final FirestoreDatasource datasource;

  FirestoreRepository(this.datasource);

  @override
  Future<String?> getUsername() async {
    return await datasource.getCurrentUsername();
  }
}
