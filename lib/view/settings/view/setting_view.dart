import 'package:flutter/material.dart';

import '../../widgets/drawer.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('setting screen'),
      ),
      body: Container(
        color: Colors.greenAccent,
      ),
      drawer: const MyDrawer(),
    );
  }
}
