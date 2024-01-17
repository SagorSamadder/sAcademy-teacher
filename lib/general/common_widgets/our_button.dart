import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget ourButton({onPress, color, textcolor, String? title}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: color, padding: const EdgeInsets.all(10)),
      onPressed: onPress,
      child: title!.text.color(textcolor).fontWeight(FontWeight.bold).make());
}
