import 'package:edgefly_academy_admin/app/privacy_policy/view/privacy_policy_view.dart';
import 'package:edgefly_academy_admin/app/wallet/view/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home_screen/view/home_screen.dart';
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
            title: const Text('Dashboard'),
            onTap: () {
              Get.offAll(() => const HomeScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              Get.offAll(() => const ProfileScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.wallet),
            title: const Text('Wallet'),
            onTap: () {
              Get.offAll(() => const WalletScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.policy),
            title: const Text('Privacy policy'),
            onTap: () {
              Get.offAll(() => const PrivacyPolicy());
            },
          ),
          ListTile(
            leading: const Icon(Icons.comment),
            title: const Text('Terms & condition'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Get.offAll(() => const SettingScreen());
            },
          ),
        ],
      ),
    );
  }
}
