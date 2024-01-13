import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionCountController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var uid = FirebaseAuth.instance.currentUser!.uid;

  RxInt totalDocuments = 0.obs;
  RxInt pendingCount = 0.obs;
  RxInt acceptedCount = 0.obs;
  RxInt rejectedCount = 0.obs;

  CollectionReference get questionCollection =>
      _firestore.collection('/questionsetter/$uid/question');

  @override
  void onInit() {
    super.onInit();
    subscribeToUpdates();
  }

  void subscribeToUpdates() {
    questionCollection.snapshots().listen((QuerySnapshot querySnapshot) {
      totalDocuments.value = querySnapshot.docs.length;
      pendingCount.value = 0;
      acceptedCount.value = 0;
      rejectedCount.value = 0;

      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        var acceptValue = doc['accept'];
        if (acceptValue == 'pending') {
          pendingCount++;
        } else if (acceptValue == 'accepted') {
          acceptedCount++;
        } else if (acceptValue == 'rejected') {
          rejectedCount++;
        }
      }
    });
  }
}
