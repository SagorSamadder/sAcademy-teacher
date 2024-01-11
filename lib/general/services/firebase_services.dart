import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  static getUser(uid) {
    return FirebaseFirestore.instance
        .collection('questionsetter')
        .where('uid', isEqualTo: uid)
        .snapshots();
  }
}
