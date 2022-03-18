import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFormFieldComp extends StatelessWidget {
  final String hint;
  final  icon;
  final textInputType;
  var prevValue;
  var textController = TextEditingController();
  TextFormFieldComp({required this.hint,required this.icon , required this.textController , String ? this.prevValue,required this.textInputType} );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      keyboardType: textInputType,
      obscureText: hint == 'Password' || hint == "Confirm Password" ? true : false  ,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.black,fontSize:20),
        prefixIcon: Icon(icon ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please Enter $hint';
        }
        /*if (prevValue != null){
          if(prevValue != value)
            return '$hint and Password are not identical';
        }*/
        return null;
      },

    );

  }
}
