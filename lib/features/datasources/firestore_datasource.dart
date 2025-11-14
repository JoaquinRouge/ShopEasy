import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreDatasource {
  FirebaseFirestore _firebase;
  FirebaseAuth _firebaseAuth;

  FirestoreDatasource(this._firebase, this._firebaseAuth);

  Future<void> createUsername(String username, String currentUserUid) async {
    final usernameNormalized = username.trim().toLowerCase();

    final exists = await _firebase
        .collection('users')
        .where('username', isEqualTo: usernameNormalized)
        .get();

    if (exists.docs.isNotEmpty) {
      throw new Exception("Username already in use");
    }

    await _firebase.collection('users').doc(currentUserUid).set({
      'username': username,
    }, SetOptions(merge: true));
  }

  Future<String?> getCurrentUsername() async {
    final currentUserUid = await _firebaseAuth.currentUser?.uid;

    final response = await _firebase.collection('users').doc(currentUserUid).get();

    return response.get('username');
  }
}
