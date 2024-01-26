import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WalletController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var uid = FirebaseAuth.instance.currentUser!.uid;

  RxInt totalDocuments = 0.obs;
  RxInt acceptedCount = 0.obs;
  RxDouble totalAccount = 0.0.obs;
  RxDouble totalWithdraws = 0.0.obs;
  RxInt totalAmountForAccepted = 0.obs;

  CollectionReference get questionCollection =>
      _firestore.collection('/questionsetter/$uid/question');

  CollectionReference get totalWithdrawss =>
      _firestore.collection('/questionsetter/$uid/transaction');

  @override
  void onInit() {
    super.onInit();
    totalWithdraw();
    subscribeToUpdates();
  }

  void totalWithdraw() async {
    totalWithdrawss.snapshots().listen((QuerySnapshot querySnapshot) async {
      totalDocuments.value = querySnapshot.docs.length;
      totalWithdraws.value = 0;
      totalAmountForAccepted.value = 0;
      var allWithdraw = <double>[].obs;

      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        var acceptValue = doc['status'];
        if (acceptValue == 'accepted' || acceptValue == 'pending') {
          var amountValue = doc['amount'];
          log("amount $amountValue");
          if (amountValue is double) {
            allWithdraw.add(amountValue);
          } else {
            allWithdraw.add(double.tryParse(amountValue.toString()) ?? 0);
          }
        }
      }
      totalWithdraws.value =
          allWithdraw.fold(0, (previous, current) => previous + current);
      log("Total withdraw $totalWithdraws");

      log("all withdraw in list $allWithdraw");
    });
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
      totalAccount.value = acceptedCount.value * 2.5 - totalWithdraws.value;
      log("total account: $totalAccount");

      // Update the Firestore document with the latest total account value
      await _firestore.collection('questionsetter').doc(uid).update({
        'account': totalAccount.value,
      });
    });
  }

  @override
  void dispose() {
    totalWithdraw();
    subscribeToUpdates();
    super.dispose();
  }
}
