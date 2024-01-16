// ignore_for_file: use_build_context_synchronously

import 'package:edgefly_academy_admin/app/question_details_edit/controller/question_edit_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../add_question/widget/text_from_field.dart';

class QuestionDetailsEdit extends StatefulWidget {
  final String documentId;
  final Map<String, dynamic> data;

  const QuestionDetailsEdit(
      {super.key, required this.data, required this.documentId});

  @override
  State<QuestionDetailsEdit> createState() => _QuestionDetailsEditState();
}

class _QuestionDetailsEditState extends State<QuestionDetailsEdit> {
  final QuestionEditController controller = Get.put(QuestionEditController());

  @override
  void initState() {
    super.initState();
    controller.initControllersWithData(widget.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Question"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Form(
              child: Container(
            padding:
                EdgeInsets.symmetric(horizontal: context.screenWidth * .05),
            decoration: BoxDecoration(
              color: const Color(0xff4bb050),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: context.screenHeight * .035),
                'Question'.text.white.make(),
                const SizedBox(height: 10),
                TextFormField(
                  controller: controller.questionController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.question_answer),
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Question',
                    hintText: 'Write question here',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          const BorderSide(width: 2.0, color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          const BorderSide(width: 2.0, color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(
                          width: 2.0, color: Color(0xFF134668)),
                    ),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Options:',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 15),
                //option 1
                QTextFromField(
                  lebels: 'Option 1',
                  controller: controller.option1Controller,
                ),
                const SizedBox(height: 10),
                //option 2
                QTextFromField(
                  lebels: 'Option 2',
                  controller: controller.option2Controller,
                ),
                const SizedBox(height: 10),
                //option 3
                QTextFromField(
                  lebels: 'Option 3',
                  controller: controller.option3Controller,
                ),
                const SizedBox(height: 10),
                //option 4
                QTextFromField(
                  lebels: 'Option 4',
                  controller: controller.option4Controller,
                ),
                const SizedBox(height: 20),
                //correct answer
                QTextFromField(
                  lebels: 'correct answer',
                  controller: controller.correctAnswerController,
                ),
                SizedBox(height: context.screenHeight * .035),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: context.screenWidth * .4,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text("Back"),
                      ),
                    ),
                    SizedBox(
                      width: context.screenWidth * .4,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 150, 255, 63)),
                        onPressed: () async {
                          await controller
                              .updateQuestionData(widget.documentId);
                          VxToast.show(context, msg: "Update complete");
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst);
                        },
                        child: const Text(
                          "Update",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.screenHeight * .035),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
