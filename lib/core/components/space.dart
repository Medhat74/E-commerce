import 'package:e_commercy/core/utils/size_config.dart';
import 'package:flutter/material.dart';



class HorizontalSpace extends StatelessWidget {
  final double? value;

  HorizontalSpace({required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.defaultSize!*value!,
    );
  }
}
class VerticalSpace extends StatelessWidget {
  final double? value;

   const VerticalSpace({required this.value});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: SizeConfig.defaultSize!*value!,
    );
  }
}