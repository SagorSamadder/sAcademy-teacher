import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home_screen/home_screen.dart';
import '../../profile/view/profile_screen.dart';
import '../../settings/view/setting_view.dart';
import 'drawer_header.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.greenAccent.withOpacity(0.8),
            ),
            child: const DrawerHeaders(),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Get.to(() => const HomeScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              Get.to(() => const ProfileScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
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
