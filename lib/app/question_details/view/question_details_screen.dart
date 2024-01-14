import 'package:flutter/material.dart';

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
          Text("${data['question']}"),
          Text("${data['option 1']}"),
        ],
      ),
    );
  }
}
