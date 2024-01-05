import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../add_question/view/add_question.dart';
import '../widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: const MyDrawer(),
      body: const Center(
        child: Text('Home Screen'),
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
