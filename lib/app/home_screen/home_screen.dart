import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../add_question/view/add_question.dart';
import '../widgets/drawer/drawer.dart';
import 'controller/question_count_controller.dart';
import 'widged/containet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final QuestionController questionController = Get.put(QuestionController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 204, 217, 253),
        elevation: 1,
        title: const Text('Dashboard'),
      ),
      drawer: const MyDrawer(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          10.heightBox,
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Sscontainner(
                  icon: Icons.post_add_outlined,
                  title: 'Total submitted',
                  count: '${questionController.totalDocuments}',
                ),
                Sscontainner(
                  icon: Icons.file_download_done_outlined,
                  title: 'Total Accepted',
                  count: '${questionController.acceptedCount}',
                ),
              ],
            ),
          ),
          SizedBox(
            height: context.screenWidth * .03,
          ),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Sscontainner(
                  icon: Icons.pending_actions_outlined,
                  title: 'Total pending',
                  count: '${questionController.pendingCount}',
                ),
                Sscontainner(
                  icon: Icons.cancel,
                  title: 'Total rejected',
                  count: '${questionController.rejectedCount}',
                ),
              ],
            ),
          ),
          15.heightBox,
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: context.screenWidth * .05),
              child: "All Question".text.size(20).bold.make(),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('title${index + 1}'),
              );
            },
          ),
        ],
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
