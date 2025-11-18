abstract class IFirestoreRepository {
  Future<String?> getUsername();
  Future<DateTime?> getCreationDate();
}
