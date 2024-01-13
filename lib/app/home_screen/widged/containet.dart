// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable
class Sscontainner extends StatelessWidget {
  var count;
  IconData? icon;
  var title;
  Sscontainner({super.key, this.count, this.icon, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight * .14,
      width: context.screenWidth * .45,
      decoration: BoxDecoration(
        color: const Color(0xff3f0097),
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 141, 73, 236),
            blurRadius: 2,
            offset: Offset(1.0, 2.0),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  10.widthBox,
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 35,
                  ),
                ],
              ),
              Text(
                count,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
