import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WithdrawController extends GetxController {
  TextEditingController amountController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController passController = TextEditingController();

  String uid = FirebaseAuth.instance.currentUser!.uid;
  String generateTimestamp() {
    DateTime currentTime = DateTime.now();
    return currentTime.toUtc().toIso8601String();
  }

  var isloading = false.obs;

  proceedWithdraw(context) async {
    try {
      isloading(true);
      String timestamp = generateTimestamp();
      Map<String, dynamic> transaction = {
        'status': 'pending',
        'uid': uid,
        'timestamp': timestamp,
        'amount': amountController.text,
        'number': numberController.text,
      };

      await FirebaseFirestore.instance
          .collection('questionsetter')
          .doc(uid)
          .collection("transaction")
          .doc(timestamp)
          .set(transaction)
          .then((value) {
        amountController.clear();
        numberController.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Request Sucessfull'),
            duration: Duration(seconds: 3),
          ),
        );
      });

      log('data uploaded');
      isloading(false);
    } catch (e) {
      log('Error is : $e');
      isloading(false);
    }
  }

  String? validfield(value) {
    if (value!.isEmpty) {
      return 'please fil this document';
    }
    RegExp emailRefExp = RegExp(r'^.{1,}$');
    if (!emailRefExp.hasMatch(value)) {
      return 'please fil this document';
    }
    return null;
  }

  String? validname(value) {
    if (value!.isEmpty) {
      return 'please enter data';
    }
    RegExp emailRefExp = RegExp(r'^.{2,}$');
    if (!emailRefExp.hasMatch(value)) {
      return 'Password enter a valid data';
    }
    return null;
  }
}
