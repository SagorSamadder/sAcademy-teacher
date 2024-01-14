import 'dart:developer';

import 'package:edgefly_academy_admin/app/home_screen/controller/question_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../add_question/view/add_question.dart';
import '../../question_details/view/question_details_screen.dart';
import '../../widgets/drawer/drawer.dart';
import '../controller/question_count_controller.dart';
import '../widged/containet.dart';

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
      body: NotificationListener(
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
              !questionController.loadingMore.value) {
            // Fetch more data when the user reaches the end of the list
            questionController.fetchMoreData();
            log("fetching more data");
          }
          return false;
        },
        child: ListView(
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
            10.heightBox,
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
                          padding: const EdgeInsets.all(8),
                          margin: EdgeInsets.only(
                              left: context.screenWidth * .05,
                              right: context.screenWidth * .05,
                              bottom: context.screenWidth * .04),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 167, 187, 241),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(255, 175, 196, 253),
                                  blurRadius: 2,
                                  offset: Offset(2, 2),
                                )
                              ]),
                          child: ListTile(
                            onTap: () {
                              Get.to(() => QuestionDetailsScreen(
                                    data: questionData,
                                  ));
                            },
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Question: ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: context.screenWidth * .012,
                                      ),
                                      Text(
                                        "${questionData['question']}",
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                      10.heightBox
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            subtitle: Row(
                              children: [
                                const Text(
                                  "Status:  ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${questionData['status']}",
                                  style: TextStyle(
                                    color: questionData['status'] == 'accepted'
                                        ? const Color.fromARGB(255, 6, 120, 219)
                                        : (questionData['status'] == 'pending'
                                            ? Colors.black
                                            : Colors.red),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            // trailing: const Expanded(
                            //   child: Icon(
                            //     Icons.arrow_circle_right,
                            //     size: 40,
                            //   ),
                            // ),
                          ),
                        );
                      },
                    ),
            ),
            Obx(
              () => Center(
                child: questionController.loadingMore.value
                    ? const CircularProgressIndicator()
                    : null,
              ),
            ),
            20.heightBox,
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
