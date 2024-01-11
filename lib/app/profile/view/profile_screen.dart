import 'package:edgefly_academy_admin/app/auth/view/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../widgets/drawer/drawer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('setting screen'),
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            InkWell(
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Get.offAll(() => const SigninScreen());
              },
              child: Container(
                height: 70,
                width: context.screenWidth * .40,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.redAccent,
                      blurRadius: 3.0,
                    ),
                  ],
                ),
                child: Center(
                  child: "Log out".text.white.bold.size(20).make(),
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
