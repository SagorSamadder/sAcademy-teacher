// ignore_for_file: unnecessary_string_interpolations, avoid_print

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../home_screen/home_screen.dart';

class AddQuestionScreen extends StatefulWidget {
  const AddQuestionScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddQuestionScreenState createState() => _AddQuestionScreenState();
}

class _AddQuestionScreenState extends State<AddQuestionScreen> {
  TextEditingController questionController = TextEditingController();
  TextEditingController optioncontroller1 = TextEditingController();
  TextEditingController optioncontroller2 = TextEditingController();
  TextEditingController optioncontroller3 = TextEditingController();
  TextEditingController optioncontroller4 = TextEditingController();
  TextEditingController correctAnswerController = TextEditingController();

  late String selectedField1 = ""; // Value for the first dropdown
  late String selectedField2 = ""; // Value for the second dropdown
  late String selectedField3 = ""; // Value for the third dropdown

  List<String> field1Items = [
    'SSC',
    'HSC',
    'Admission'
  ]; // Items for the first dropdown
  List<String> field2Items = [
    'English',
    'Bangla',
    'Genaral math',
    'Physics',
    'Chemistry',
    'Biology',
    'Hiremath'
  ]; // Items for the second dropdown
  List<String> field3Items = [
    'chapter 1',
    'chapter 2',
    'chapter 3',
    'chapter 4',
    'chapter 5',
    'chapter 6',
    'chapter 7',
    'chapter 8',
    'chapter 9',
    'chapter 10',
    'chapter 11',
    'chapter 12'
  ]; // Items for the third dropdown

  @override
  Widget build(BuildContext context) {
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
                decoration: BoxDecoration(
                  border:
                      Border.all(width: 2.0, color: const Color(0xFF134668)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButtonFormField<String>(
                  hint: const Text('Select category'),
                  onChanged: (value) {
                    setState(() {
                      selectedField1 = value!;
                      print('$value');
                    });
                  },
                  items: field1Items.map((item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border:
                      Border.all(width: 2.0, color: const Color(0xFF134668)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButtonFormField<String>(
                  hint: const Text('Select Subject'),
                  onChanged: (value) {
                    setState(() {
                      selectedField2 = value!;
                    });
                  },
                  items: field2Items.map((item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border:
                      Border.all(width: 2.0, color: const Color(0xFF134668)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButtonFormField<String>(
                  hint: const Text('Select Chapter'),
                  onChanged: (value) {
                    setState(() {
                      selectedField3 = value!;
                    });
                  },
                  items: field3Items.map((item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Now Write Question'),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: questionController,
                decoration: InputDecoration(
                  labelText: 'Enter the question',
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
                    borderSide:
                        const BorderSide(width: 2.0, color: Color(0xFF134668)),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text('Options:'),
              const SizedBox(height: 15),

              //option 1
              TextFormField(
                controller: optioncontroller1,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.circle),
                  labelText: 'Option 1',
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
                    borderSide:
                        const BorderSide(width: 2.0, color: Color(0xFF134668)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              //option 2
              TextFormField(
                controller: optioncontroller2,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.circle),
                  labelText: 'Option 2',
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
                    borderSide:
                        const BorderSide(width: 2.0, color: Color(0xFF134668)),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              //option 3
              TextFormField(
                controller: optioncontroller3,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.circle),
                  labelText: 'Option 3',
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
                    borderSide:
                        const BorderSide(width: 2.0, color: Color(0xFF134668)),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              //option 4
              TextFormField(
                controller: optioncontroller4,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.circle),
                  labelText: 'Option 4',
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
                    borderSide:
                        const BorderSide(width: 2.0, color: Color(0xFF134668)),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              TextFormField(
                controller: correctAnswerController,
                decoration: InputDecoration(
                  labelText: 'Enter the correct answer',
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
                    borderSide:
                        const BorderSide(width: 2.0, color: Color(0xFF134668)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 70,
                    width: context.screenWidth * .4,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purpleAccent),
                      onPressed: () async {
                        const Center(child: CircularProgressIndicator());
                        try {
                          Map<String, dynamic> questionmap = {
                            'category': selectedField1.toString(),
                            'subject': selectedField2.toString(),
                            'chapter': selectedField3.toString(),
                            'question': questionController.text,
                            'option1': optioncontroller1.text,
                            'option2': optioncontroller2.text,
                            'option3': optioncontroller3.text,
                            'option4': optioncontroller4.text,
                            'answer': correctAnswerController.text,
                          };

                          await FirebaseFirestore.instance
                              .collection('question')
                              .doc(selectedField1)
                              .collection(selectedField2)
                              .doc(selectedField3)
                              .collection(selectedField3)
                              .doc()
                              .set(questionmap)
                              .then((value) {
                            questionController.clear();
                            optioncontroller1.clear();
                            optioncontroller2.clear();
                            optioncontroller3.clear();
                            optioncontroller4.clear();
                            correctAnswerController.clear();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Data uploaded Sucessfully'),
                                duration:
                                    Duration(seconds: 3), // Adjust as needed
                              ),
                            );
                            _showDialog(context);
                          });

                          print('data uploaded');
                        } catch (e) {
                          print('Error is : $e');
                        }
                      },
                      child: const Text(
                        'Add Question',
                        style: TextStyle(color: Colors.white),
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

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you want to upload More Question'),
          actions: [
            TextButton(
              onPressed: () {
                Get.to(() => const DashboardScreen());
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
