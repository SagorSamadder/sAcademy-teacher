import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServicesProfile {
  //Get users data
  static getUser(uid) {
    return FirebaseFirestore.instance
        .collection('questionsetter')
        .where('uid', isEqualTo: uid)
        .snapshots();
  }
}
