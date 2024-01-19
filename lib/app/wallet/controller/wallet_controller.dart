import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WalletController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var uid = FirebaseAuth.instance.currentUser!.uid;

  RxInt totalDocuments = 0.obs;
  RxInt acceptedCount = 0.obs;
  RxInt totalAccount = 0.obs;

  CollectionReference get questionCollection =>
      _firestore.collection('/questionsetter/$uid/question');

  @override
  void onInit() {
    super.onInit();
    subscribeToUpdates();
  }

  void subscribeToUpdates() async {
    questionCollection.snapshots().listen((QuerySnapshot querySnapshot) async {
      totalDocuments.value = querySnapshot.docs.length;
      acceptedCount.value = 0;

      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        var acceptValue = doc['status'];
        if (acceptValue == 'accepted') {
          acceptedCount++;
        }
      }

      // Calculate total account after processing all documents
      totalAccount.value = acceptedCount.value * 2;
      print("total account: $totalAccount");

      // Update the Firestore document with the latest total account value
      await _firestore.collection('questionsetter').doc(uid).update({
        'account': totalAccount.value,
      });
    });
  }
}
