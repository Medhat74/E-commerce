import 'package:e_commercy/core/components/general_button.dart';
import 'package:e_commercy/core/utils/size_config.dart';
import 'package:e_commercy/src/app_colors.dart';
import 'package:flutter/material.dart';

class ListViewWhite extends StatelessWidget {
  final List categoryList;


  ListViewWhite(this.categoryList);


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: categoryList.length,
      //cubit.categories.length,
      itemBuilder: (BuildContext context, int index) => Container(
        width: SizeConfig.defaultSize!* 20,
        height: SizeConfig.defaultSize!*18,
        child: Card(
          color: Colors.white,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Align(
                alignment: Alignment.topRight,
                heightFactor: 0.5,
                child: IconButton(
                  icon : Icon(Icons.favorite_border),
                  onPressed: () {

                  },
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/logo.png',
                  height: SizeConfig.defaultSize!*8,
                ),
              ),

              Text(
                "categoryList[index]",
                style: TextStyle(
                  fontSize: SizeConfig.defaultSize!*1.7,
                ),
              ),
              Text(
                "000",
                style: TextStyle(
                  fontSize: SizeConfig.defaultSize!*2,
                  color: AppColors.KPrimaryRedColor,
                ),
              ),

              Container(
                  width: SizeConfig.defaultSize!*17,
                  child: GeneralButton("Add to", (){})
              ),
            ],
          ),
        ),
      ),
    );
  }
}
