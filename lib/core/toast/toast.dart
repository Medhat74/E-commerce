import 'package:e_commercy/enums/ToostStates.dart';
import 'package:e_commercy/src/app_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
 class ToastConfig{

   static showToast({
     required String msg,
     required ToastStates toastStates,
   }) =>
       Fluttertoast.showToast(
         msg: msg,
         toastLength: Toast.LENGTH_LONG,
         gravity: ToastGravity.BOTTOM,
         timeInSecForIosWeb: 5,
         backgroundColor: chooseToastColor(toastStates),
         textColor: Colors.white,
         fontSize: 16.0,
       );
 }


Color chooseToastColor(ToastStates state) {
  late Color color;
  switch (state) {
    case ToastStates.Success:
      color = Colors.green;
      break;
    case ToastStates.Error:
      color = AppColors.KPrimaryRedColor;
      break;
    case ToastStates.Warning:
      color = Colors.amber;
      break;
  }

  return color;
}
