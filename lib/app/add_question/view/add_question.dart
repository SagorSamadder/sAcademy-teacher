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
  final GlobalKey<FormState> formkeys = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AddQuestionController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff4bb050),
        title: const Text('Add Question'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: formkeys,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.screenWidth * .05),
                  decoration: BoxDecoration(
                    color: const Color(0xff4bb050),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: context.screenHeight * .035),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButtonFormField<String>(
                          validator: controller.validDropdownbutton,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
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
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButtonFormField<String>(
                          validator: controller.validDropdownbutton,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
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
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButtonFormField<String>(
                          validator: controller.validDropdownbutton,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
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
                      SizedBox(height: context.screenHeight * .035),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.screenWidth * .05),
                  decoration: BoxDecoration(
                    color: const Color(0xff4bb050),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: context.screenHeight * .035),
                      'Now Write the Question'.text.white.make(),
                      const SizedBox(
                        height: 10,
                      ),
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
                            borderSide: const BorderSide(
                                width: 2.0, color: Colors.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                                width: 2.0, color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                                width: 2.0, color: Color(0xFF134668)),
                          ),
                        ),
                        validator: controller.validfield,
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
                        controller: controller.optioncontroller1,
                        validator: controller.validfield,
                      ),
                      const SizedBox(height: 10),
                      //option 2
                      QTextFromField(
                        lebels: 'Option 2',
                        controller: controller.optioncontroller2,
                        validator: controller.validfield,
                      ),
                      const SizedBox(height: 10),
                      //option 3
                      QTextFromField(
                        lebels: 'Option 3',
                        controller: controller.optioncontroller3,
                        validator: controller.validfield,
                      ),
                      const SizedBox(height: 10),
                      //option 4
                      QTextFromField(
                        lebels: 'Option 4',
                        controller: controller.optioncontroller4,
                        validator: controller.validfield,
                      ),
                      const SizedBox(height: 20),
                      //correct answer
                      QTextFromField(
                        lebels: 'Enter the correct answer',
                        controller: controller.correctAnswerController,
                        validator: controller.validfield,
                      ),
                      SizedBox(height: context.screenHeight * .035),
                    ],
                  ),
                ),
                SizedBox(height: context.screenHeight * .04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 70,
                      width: context.screenWidth * .5,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff4bb050)),
                        onPressed: () async {
                          if (formkeys.currentState!.validate()) {
                            controller.uploadQuestion(context);
                          } else {
                            VxToast.show(context,
                                msg: "fill all the documents first");
                          }
                        },
                        child: Obx(
                          () => controller.isloading.value
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : const Text(
                                  'Add Question',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                ),
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
      ),
    );
  }
}
