import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home_screen/view/home_screen.dart';

showDialogs(
  BuildContext context,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Are you want to upload More Question'),
        actions: [
          TextButton(
            onPressed: () {
              Get.to(() => const HomeScreen());
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
