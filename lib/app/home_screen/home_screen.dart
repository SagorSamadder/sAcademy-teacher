import 'package:edgefly_academy_admin/app/home_screen/controller/question_controller.dart';
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
    final QuestionCountController questionCountController =
        Get.put(QuestionCountController());
    final QuestionController questionController = Get.put(QuestionController());
    return Scaffold(
      backgroundColor: const Color(0xffdce5fd),
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
                  count: '${questionCountController.totalDocuments}',
                ),
                Sscontainner(
                  icon: Icons.file_download_done_outlined,
                  title: 'Total Accepted',
                  count: '${questionCountController.acceptedCount}',
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
                  count: '${questionCountController.pendingCount}',
                ),
                Sscontainner(
                  icon: Icons.cancel,
                  title: 'Total rejected',
                  count: '${questionCountController.rejectedCount}',
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
          Obx(
            () => questionController.questionList.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        60.heightBox,
                        Text(
                          "You Don't submit any Question",
                          style: TextStyle(
                              fontSize: context.screenWidth * .06,
                              fontWeight: FontWeight.w500),
                        ),
                        Image.asset(
                          'assets/images/empty.png',
                          width: context.screenWidth * .7,
                        )
                      ],
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: questionController.questionList.length,
                    itemBuilder: (context, index) {
                      var questionData =
                          questionController.questionList[index].data();
                      return Container(
                        decoration: BoxDecoration(),
                        child: ListTile(
                          title:
                              Text(questionData['question'] ?? "No question"),
                        ),
                      );
                    },
                  ),
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
