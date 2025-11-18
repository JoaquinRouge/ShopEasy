import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreDatasource {
  FirebaseFirestore _firebase;
  FirebaseAuth _firebaseAuth;

  FirestoreDatasource(this._firebase, this._firebaseAuth);

  Future<void> createUsername(String username, String currentUserUid) async {
    final exists = await _firebase
        .collection('users')
        .where('username', isEqualTo: username)
        .get();

    if (exists.docs.isNotEmpty) {
      throw FirebaseAuthException(
        code: "username-taken",
        message: "El nombre de usuario ya esta en uso.",
      );
    }

    await _firebase.collection('users').doc(currentUserUid).set({
      'username': username,
    }, SetOptions(merge: true));
  }

  Future<String?> getCurrentUsername() async {
    final currentUserUid = _firebaseAuth.currentUser?.uid;

    final response = await _firebase
        .collection('users')
        .doc(currentUserUid)
        .get();

    return response.data()?['username'];
  }

  Future<DateTime?> getCreationDate() async{
    return _firebaseAuth.currentUser?.metadata.creationTime;
  }
}
