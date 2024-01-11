// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edgefly_academy_admin/general/consts/firebase_consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../home_screen/home_screen.dart';

class AuthController extends GetxController {
  var isloading = false.obs;
  //text controller
  var namecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();

  //login method

  Future<void> loginMethod({BuildContext? context}) async {
    try {
      isloading(true);
      await auth.signInWithEmailAndPassword(
          email: emailcontroller.text, password: passwordcontroller.text);

      await storeUserData(
        email: emailcontroller.value.text,
        password: passwordcontroller.value.text,
        name: namecontroller.value.text,
      );

      VxToast.show(context!, msg: "login successed");

      Get.offAll(() => const HomeScreen());
      isloading(false);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context!, msg: e.toString());
      log('$e');
      isloading(false);
    }
  }

  //storeing data to database
  storeUserData({name, password, email}) async {
    DocumentReference store =
        firestore.collection(questionSetter).doc(currentUser!.uid);
    store.set({
      'password': password,
      'email': email,
      'imageUrl': '',
      'id': currentUser!.uid,
      'Qname': name,
      'Qaccount': '',
    });
  }

  signoutMethod(context) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  String? validname(value) {
    if (value!.isEmpty) {
      return 'please fill this first';
    }
    RegExp emailRefExp = RegExp(r'^.{4,}$');
    if (!emailRefExp.hasMatch(value)) {
      return 'Please fill this with valid data';
    }
    return null;
  }
}
