import 'package:e_commercy/src/app_colors.dart';
import 'package:flutter/material.dart';

class TextType extends StatelessWidget {
  final String text;


  TextType(this.text);

  @override
  Widget build(BuildContext context) {
    return  Text(
      "$text",
      style: TextStyle(
        color: AppColors.KPrimaryColor,
        fontSize: 20,
      ),
    );

  }
}
