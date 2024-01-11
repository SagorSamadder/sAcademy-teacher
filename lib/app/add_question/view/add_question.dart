import 'dart:developer';
import 'package:edgefly_academy_admin/app/add_question/controller/add_question_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widget/text_from_field.dart';

class AddQuestionScreen extends StatefulWidget {
  const AddQuestionScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddQuestionScreenState createState() => _AddQuestionScreenState();
}

class _AddQuestionScreenState extends State<AddQuestionScreen> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AddQuestionController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Question'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xff4bb050),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    10.heightBox,
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButtonFormField<String>(
                        hint: const Text('Select category'),
                        onChanged: (value) {
                          setState(() {
                            controller.selectedField1 = value!;
                            log(value);
                          });
                        },
                        items: controller.field1Items.map((item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButtonFormField<String>(
                        hint: const Text('Select Subject'),
                        onChanged: (value) {
                          setState(() {
                            controller.selectedField2 = value!;
                          });
                        },
                        items: controller.field2Items.map((item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButtonFormField<String>(
                        hint: const Text('Select Chapter'),
                        onChanged: (value) {
                          setState(() {
                            controller.selectedField3 = value!;
                          });
                        },
                        items: controller.field3Items.map((item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                      ),
                    ),
                    10.heightBox,
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xff4bb050),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    'Now Write the Question'.text.white.make(),
                    const SizedBox(
                      height: 8,
                    ),
                    QTextFromField(
                      lebels: 'Enter the question',
                      controller: controller.questionController,
                    ),
                    const SizedBox(height: 10),
                    const Text('Options:'),
                    const SizedBox(height: 15),
                    //option 1
                    QTextFromField(
                      lebels: 'Option 1',
                      controller: controller.optioncontroller1,
                    ),
                    const SizedBox(height: 20),
                    //option 2
                    QTextFromField(
                      lebels: 'Option 2',
                      controller: controller.optioncontroller2,
                    ),
                    const SizedBox(height: 10),
                    //option 3
                    QTextFromField(
                      lebels: 'Option 3',
                      controller: controller.optioncontroller3,
                    ),
                    const SizedBox(height: 10),
                    //option 4
                    QTextFromField(
                      lebels: 'Option 4',
                      controller: controller.optioncontroller4,
                    ),
                    const SizedBox(height: 20),
                    //correct answer
                    QTextFromField(
                      lebels: 'Enter the correct answer',
                      controller: controller.correctAnswerController,
                    ),
                    20.heightBox,
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 70,
                    width: context.screenWidth * .5,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.greenAccent),
                      onPressed: () async {
                        controller.uploadQuestion(context);
                      },
                      child: const Text(
                        'Add Question',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  30.heightBox,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
