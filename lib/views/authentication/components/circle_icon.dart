import 'package:e_commercy/src/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget {
  final  icon;


  CircleIcon(this.icon);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: Icon(
        icon,
        color: AppColors.KPrimaryColor,
      ),
      backgroundColor: AppColors.KLightSilverColor,
    );
  }
}
