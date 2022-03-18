import 'package:e_commercy/bloc/product/product_cubit.dart';
import 'package:e_commercy/core/components/general_button.dart';
import 'package:e_commercy/core/components/text_type.dart';
import 'package:e_commercy/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsView extends StatelessWidget {
  List? products;
  final String productsName;
  final int id;


  ProductsView(this.productsName, this.id);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit,ProductState>(
      listener: (context , state){},
      builder: (context , state){
        var cubit = ProductCubit.get(context);

        return Scaffold(
          appBar: AppBar(

          ),

          body: Column(
            children: [
              TextType("All Category"),

              Expanded(
                child: GridView.builder(
                  gridDelegate:  const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 250,
                      mainAxisExtent: 170,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index){
                    return GestureDetector(
                      onTap: (){

                      },
                      child: Card(

                        child: Column(
                          children: [

                            Image.asset(
                              'assets/images/logo.png',
                              height: SizeConfig.defaultSize!*7,),

                            Text(
                              'name',
                              style: TextStyle(
                                fontSize: SizeConfig.defaultSize!*3,
                                //fontWeight: FontWeight.bold[400],
                              ),
                              //'${cubit.categories[index].name}'
                            ),

                            GeneralButton("Add to Cart" , (){})
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),



            ],
          ),
        );
      },
    );
  }
}
