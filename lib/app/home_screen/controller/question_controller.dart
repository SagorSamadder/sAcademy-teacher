import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class QuestionController extends GetxController {
  var uid = FirebaseAuth.instance.currentUser!.uid;
  var loadingMore = false.obs;
  final CollectionReference questionSetterCollection =
      FirebaseFirestore.instance.collection('questionsetter');

  RxList<QueryDocumentSnapshot<Map<String, dynamic>>> questionList =
      <QueryDocumentSnapshot<Map<String, dynamic>>>[].obs;

  DocumentSnapshot<Map<String, dynamic>>? lastDocument;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() {
    questionSetterCollection
        .doc(uid)
        .collection('question')
        .orderBy('timestamp', descending: true)
        .limit(15)
        .snapshots()
        .listen((snapshot) {
      questionList.assignAll(snapshot.docs);
      if (snapshot.docs.isNotEmpty) {
        lastDocument = snapshot.docs.last;

        log(questionList.length.toString());
      }
    }, onError: (e) {
      log("Error fetching data: $e");
    });
  }

  void fetchMoreData() {
    if (!loadingMore.value && lastDocument != null) {
      loadingMore(true); // Set loadingMore to true to prevent multiple calls
      questionSetterCollection
          .doc(uid)
          .collection('question')
          .orderBy('timestamp', descending: true)
          .startAfterDocument(lastDocument!)
          .limit(15)
          .get()
          .then((snapshot) {
        if (snapshot.docs.isNotEmpty) {
          // Append the new documents to the existing list
          questionList.addAll(snapshot.docs);
          // Update the lastDocument for the next pagination
          lastDocument = snapshot.docs.last;
          log("New lastDocument ID: ${lastDocument!.id}");
          log("Updated questionList length: ${questionList.length}");
          log("fetching more data");
        }
      }).catchError((e) {
        log("Error fetching more data: $e");
      }).whenComplete(() {
        loadingMore(false);
      });
    }
  }
}
