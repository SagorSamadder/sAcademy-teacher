import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Center(
        child: Text('Home Screen Content'),
      ),
      drawer: const MyDrawer(),
    );
  }
}


// floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Get.to(() => const AddQuestionScreen());
//         },
//         backgroundColor: Colors.deepPurple.shade400,
//         child: const Icon(Icons.add),
//       ),