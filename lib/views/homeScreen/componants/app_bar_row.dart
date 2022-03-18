import 'package:e_commercy/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class AppBarRow extends StatelessWidget {
  const AppBarRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: SizeConfig.defaultSize!*20 ,
          height: SizeConfig.defaultSize!*4,
          child: TextField(
            decoration: InputDecoration(
              border:  OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.black)
              ),
              hintText: "search",
              hintStyle: TextStyle(

              ),
              suffixIcon: Icon(Icons.search),
            ),


          ),
        ),
      ],
    );
  }
}
