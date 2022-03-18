import 'package:flutter/material.dart';


class MyText extends StatelessWidget {

  final String text;
  final Color color;
  final bool bold;
  final double fontSize;


  MyText({required this.text, required this.color, required this.bold, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        fontSize: fontSize,
      ),

    );
  }
}
