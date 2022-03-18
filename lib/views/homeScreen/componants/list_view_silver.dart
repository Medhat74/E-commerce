import 'package:e_commercy/core/utils/naviagtion.dart';
import 'package:e_commercy/core/utils/size_config.dart';
import 'package:e_commercy/src/app_colors.dart';
import 'package:e_commercy/views/productView/products_view.dart';
import 'package:flutter/material.dart';

class ListViewSilver extends StatelessWidget {
  final List category;
  final function;

  ListViewSilver(this.category, this.function);


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: category.length,
      //cubit.categories.length,
      itemBuilder: (BuildContext context, int index) => GestureDetector(
        onTap: (){
          AppNavigator.customNavigator(context: context, screen: ProductsView(category[index], 1), finish: false);
        },
        child: Card(

          color: AppColors.KPrimarySilverColor,
          child: Column(
            children: [

              Image.asset(
                'assets/images/logo.png',
                height: SizeConfig.defaultSize!*10,),

              Text(
                'name',
                style: TextStyle(
                  fontSize: SizeConfig.defaultSize!*3,
                  //fontWeight: FontWeight.bold[400],
                ),
                //'${cubit.categories[index].name}'
              ),
            ],
          ),
        ),
      ),
    );
  }
}
