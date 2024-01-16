import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionEditController extends GetxController {
  final TextEditingController questionController = TextEditingController();
  final TextEditingController option1Controller = TextEditingController();
  final TextEditingController option2Controller = TextEditingController();
  final TextEditingController option3Controller = TextEditingController();
  final TextEditingController option4Controller = TextEditingController();
  final TextEditingController correctAnswerController = TextEditingController();
  String uid = FirebaseAuth.instance.currentUser!.uid;

  // Function to initialize controllers with current data
  void initControllersWithData(Map<String, dynamic> data) {
    questionController.text = data['question'] ?? '';
    option1Controller.text = data['option1'] ?? '';
    option2Controller.text = data['option2'] ?? '';
    option3Controller.text = data['option3'] ?? '';
    option4Controller.text = data['option4'] ?? '';
    correctAnswerController.text = data['answer'] ?? '';
  }

  // Function to update data in Firestore
  Future<void> updateQuestionData(String documentId) async {
    try {
      await FirebaseFirestore.instance
          .collection('questionsetter')
          .doc(uid)
          .collection('question')
          .doc(documentId)
          .update({
        'question': questionController.text,
        'option1': option1Controller.text,
        'option2': option2Controller.text,
        'option3': option3Controller.text,
        'option4': option4Controller.text,
        'answer': correctAnswerController.text,
      });
      Get.snackbar('Success', 'Question updated successfully');
      log('Sucess update');
      Get.back();
    } catch (error) {
      Get.snackbar('Error', 'Failed to update question: $error');
      log(error.toString());
    }
  }
}
