import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Future<void> deleteDocument(String documentId) async {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  try {
    await FirebaseFirestore.instance
        .collection('questionsetter')
        .doc(uid)
        .collection('question')
        .doc(documentId)
        .delete();
    log('Document deleted successfully');
  } catch (error) {
    log('Error deleting document: $error');
  }
}

void showConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Confirmation'),
        content: const Text('Are you sure you want to delete this question?'),
        actions: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: const Color(0xff4bb050),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          10.widthBox,
          Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                log('Confirmed');
              },
              child: const Text(
                'Confirm',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      );
    },
  );
}
