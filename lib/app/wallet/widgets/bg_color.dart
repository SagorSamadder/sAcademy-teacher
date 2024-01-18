import 'package:flutter/material.dart';

Widget bgWidget({Widget? child}) {
  return Container(
    height: 300,
    width: double.infinity,
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.blue, Colors.green],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: child,
  );
}
