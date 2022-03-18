import 'package:e_commercy/core/utils/naviagtion.dart';
import 'package:e_commercy/src/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GeneralButton extends StatelessWidget {
  final String text;
  final function;

  GeneralButton(this.text ,this.function);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function,
      child:Text (text,),
      style: ElevatedButton.styleFrom(
        primary: AppColors.KPrimaryColor, // Background color
      ),
    );
  }
}
