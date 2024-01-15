import 'package:flutter/material.dart';
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
      body: Column(
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
                    child: Text("Question: ${data['question']}"),
                  ),
                  10.heightBox,
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(context.screenWidth * .04),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text("Option 1: ${data['optiono1']}"),
                  ),
                  10.heightBox,
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(context.screenWidth * .04),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text("Option 2: ${data['option2']}"),
                  ),
                  10.heightBox,
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(context.screenWidth * .04),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text("Option: ${data['option3']}"),
                  ),
                  10.heightBox,
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(context.screenWidth * .04),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text("Option 4: ${data['option4']}"),
                  ),
                  10.heightBox,
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(context.screenWidth * .04),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text("Correct Answer: ${data['answer']}"),
                  ),
                  20.heightBox,
                  Row(
                    children: [
                      SizedBox(
                          width: context.screenWidth * .4,
                          child: ElevatedButton(
                              onPressed: () {}, child: Text("Edit"))),
                      SizedBox(
                          width: context.screenWidth * .4,
                          child: ElevatedButton(
                              onPressed: () {}, child: Text("Delete"))),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
