import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../widget/show_dialouge.dart';

class AddQuestionController extends GetxController {
  TextEditingController questionController = TextEditingController();
  TextEditingController optioncontroller1 = TextEditingController();
  TextEditingController optioncontroller2 = TextEditingController();
  TextEditingController optioncontroller3 = TextEditingController();
  TextEditingController optioncontroller4 = TextEditingController();
  TextEditingController correctAnswerController = TextEditingController();

  late String selectedField1 = ""; // Value for the first dropdown
  late String selectedField2 = ""; // Value for the second dropdown
  late String selectedField3 = ""; // Value for the third dropdown

  String uid = FirebaseAuth.instance.currentUser!.uid;
  String generateTimestamp() {
    DateTime currentTime = DateTime.now();
    return currentTime.toUtc().toIso8601String();
  }

  String formattedDate = DateFormat('MMMM d, y hh:mm a').format(DateTime.now());

  var isloading = false.obs;
  List<String> field1Items = [
    'SSC',
    'HSC',
    'Admission'
  ]; // Items for the first dropdown
  List<String> field2Items = [
    'Physics',
    'Chemistry',
    'Biology',
    'Hiremath'
  ]; // Items for the second dropdown
  List<String> field3Items = [
    'chapter 1',
    'chapter 2',
    'chapter 3',
    'chapter 4',
    'chapter 5',
    'chapter 6',
    'chapter 7',
    'chapter 8',
    'chapter 9',
    'chapter 10',
    'chapter 11',
    'chapter 12'
  ];

  uploadQuestion(context) async {
    try {
      isloading(true);
      String timestamp = generateTimestamp();
      Map<String, dynamic> questionmap = {
        'category': selectedField1.toString(),
        'subject': selectedField2.toString(),
        'chapter': selectedField3.toString(),
        'question': questionController.text,
        'option1': optioncontroller1.text,
        'option2': optioncontroller2.text,
        'option3': optioncontroller3.text,
        'option4': optioncontroller4.text,
        'answer': correctAnswerController.text,
        'status': 'pending',
        'qsUid': uid,
        'submitTime': formattedDate,
        'timestamp': timestamp,
      };

      await FirebaseFirestore.instance
          .collection('questionsetter')
          .doc(uid)
          .collection("question")
          .doc(timestamp)
          .set(questionmap)
          .then((value) async {
        await FirebaseFirestore.instance
            .collection("PendingQestions")
            .doc(timestamp)
            .set(questionmap);
        questionController.clear();
        optioncontroller1.clear();
        optioncontroller2.clear();
        optioncontroller3.clear();
        optioncontroller4.clear();
        correctAnswerController.clear();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Question upload Sucessfully'),
            duration: Duration(seconds: 3), // Adjust as needed
          ),
        );
        showDialogs(context);
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

  String? validDropdownbutton(values) {
    if (values == null || values.isEmpty) {
      return 'Please select an option';
    }
    return null;
  }
}
