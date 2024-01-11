import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../widgets/drawer/drawer.dart';

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
                color: const Color.fromARGB(255, 140, 236, 190),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 140, 236, 190),
                    blurRadius: 3.0,
                  ),
                ],
              ),
              child: const Center(
                child: Text("Terms & Condition"),
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
