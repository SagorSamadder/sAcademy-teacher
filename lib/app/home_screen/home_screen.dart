import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../add_question/view/add_question.dart';
import '../widgets/drawer/drawer.dart';
import 'widged/containet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 204, 217, 253),
        elevation: 1,
        title: const Text('Dashboard'),
      ),
      drawer: const MyDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xffdce5fd),
        ),
        child: Column(
          children: [
            //showing all numbers
            10.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Sscontainner(
                  icon: Icons.post_add_outlined,
                  title: 'Total submited',
                  count: '100',
                ),
                Sscontainner(
                  icon: Icons.file_download_done_outlined,
                  title: 'Total Accepted',
                  count: '50',
                ),
              ],
            ),
            SizedBox(
              height: context.screenWidth * .03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Sscontainner(
                  icon: Icons.pending_actions_outlined,
                  title: 'Total pending',
                  count: '30',
                ),
                Sscontainner(
                  icon: Icons.cancel,
                  title: 'Total rejected',
                  count: '20',
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const AddQuestionScreen());
        },
        backgroundColor: Colors.deepPurple.shade400,
        child: const Icon(Icons.add),
      ),
    );
  }
}
