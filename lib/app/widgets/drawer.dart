import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_screen/home_screen.dart';
import '../settings/view/setting_view.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Get.to(() => const HomeScreen());
            },
          ),
          ListTile(
            title: const Text('Settings'),
            onTap: () {
              Get.to(() => const SettingScreen());
            },
          ),
        ],
      ),
    );
  }
}
