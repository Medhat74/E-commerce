import 'package:e_commercy/core/components/general_button.dart';
import 'package:e_commercy/core/utils/size_config.dart';
import 'package:e_commercy/models/product_hub.dart';
import 'package:e_commercy/src/app_colors.dart';
import 'package:flutter/material.dart';

class SingleProductView extends StatelessWidget {
  final ProductHub product;


  SingleProductView(this.product);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppColors.KPrimarySilverColor,
        ),
        Card(
          color: Colors.white,
          child: Column(
            children: [
              Image.network('https://img.freepik.com/free-vector/realistic-white-smartphone-design-with-three-cameras_23-2148374059.jpg'),

              Text(
                "${product.data![0].name}",
              ),

              Container(
                width: SizeConfig.screenWidth!*0.8,
                child: GeneralButton("Add to cart", (){

                }),
              )



            ],
          ),

        )

      ],

    );
  }
}
