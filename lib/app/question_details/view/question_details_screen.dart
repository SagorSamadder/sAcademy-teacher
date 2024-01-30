import 'package:edgefly_academy_admin/app/question_details/services/delete_question.dart';
import 'package:edgefly_academy_admin/app/question_details_edit/view/question_details_edit_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class QuestionDetailsScreen extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final data;
  const QuestionDetailsScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 204, 217, 253),
        elevation: 1,
        title: const Text('Question details'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: context.screenWidth,
                padding: EdgeInsets.all(context.screenWidth * .05),
                decoration: BoxDecoration(
                  color: const Color(0xff4bb050),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(context.screenWidth * .04),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Category: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Expanded(
                            child: Text(
                              "${data['category']}",
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    10.heightBox,
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(context.screenWidth * .04),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Subject: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Expanded(
                            child: Text(
                              "${data['subject']}",
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    10.heightBox,
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(context.screenWidth * .04),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Question: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Expanded(
                            child: Text(
                              "${data['question']}",
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    10.heightBox,
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(context.screenWidth * .04),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Option 1: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Expanded(
                            child: Text(
                              "${data['option1']}",
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    10.heightBox,
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(context.screenWidth * .04),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Option 2: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Expanded(
                            child: Text(
                              "${data['option2']}",
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    10.heightBox,
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(context.screenWidth * .04),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Option 3: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Expanded(
                            child: Text(
                              "${data['option3']}",
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    10.heightBox,
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(context.screenWidth * .04),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Option 4: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Expanded(
                            child: Text(
                              "${data['option4']}",
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    10.heightBox,
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(context.screenWidth * .04),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Correct answer: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Expanded(
                            child: Text(
                              "${data['answer']}",
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    20.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: context.screenWidth * .4,
                          child: ElevatedButton(
                            onPressed: () {
                              data['status'] == 'pending'
                                  ? Get.to(() => QuestionDetailsEdit(
                                        data: data,
                                        documentId: data['timestamp'],
                                      ))
                                  : VxToast.show(context,
                                      msg: "You cant't edit this");
                            },
                            child: const Text("Edit"),
                          ),
                        ),
                        SizedBox(
                          width: context.screenWidth * .4,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            onPressed: () async {
                              data['status'] == 'rejected'
                                  ? showConfirmationDialog(
                                      context, data['timestamp'])
                                  : VxToast.show(context,
                                      msg: "You can't delete this");
                            },
                            child: const Text(
                              "Delete",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
