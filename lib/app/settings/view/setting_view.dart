import 'package:edgefly_academy_admin/app/auth/view/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../widgets/drawer.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('setting screen'),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            50.heightBox,
            Container(
              height: 70,
              width: context.screenWidth * .70,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 3.0,
                  ),
                ],
              ),
              child: const Center(
                child: Text("Privacy policy"),
              ),
            ),
            20.heightBox,
            Container(
              height: 70,
              width: context.screenWidth * .70,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 3.0,
                  ),
                ],
              ),
              child: const Center(
                child: Text("Terms & Condition"),
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Get.offAll(() => const SigninScreen());
              },
              child: Container(
                height: 70,
                width: context.screenWidth * .70,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 3.0,
                    ),
                  ],
                ),
                child: const Center(
                  child: Text("Log out"),
                ),
              ),
            ),
            50.heightBox,
          ],
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
