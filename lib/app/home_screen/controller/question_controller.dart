import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionController extends GetxController {
  var uid = FirebaseAuth.instance.currentUser!.uid;
  final CollectionReference questionSetterCollection =
      FirebaseFirestore.instance.collection('questionsetter');

  RxList<QueryDocumentSnapshot<Map<String, dynamic>>> questionList =
      <QueryDocumentSnapshot<Map<String, dynamic>>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() {
    questionSetterCollection.doc(uid).collection('question').snapshots().listen(
        (snapshot) {
      questionList.assignAll(snapshot.docs);
    }, onError: (e) {
      log("Error fetching data: $e");
    });
  }
}
