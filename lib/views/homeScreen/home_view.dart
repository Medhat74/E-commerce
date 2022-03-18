import 'package:e_commercy/bloc/category/category_cubit.dart';
import 'package:e_commercy/core/components/space.dart';
import 'package:e_commercy/core/toast/toast.dart';
import 'package:e_commercy/core/utils/size_config.dart';
import 'package:e_commercy/enums/ToostStates.dart';
import 'package:e_commercy/views/homeScreen/componants/app_bar_row.dart';
import 'package:e_commercy/views/homeScreen/componants/list_view_silver.dart';
import 'package:e_commercy/core/components/text_type.dart';
import 'package:e_commercy/views/setting/setting_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'componants/list_view_white.dart';

class HomeView extends StatelessWidget {
  List category = ['a' , 'b' , 'c' , 'd' , 'e'];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit , CategoryState>(
      listener: (context,state){
        if(state is CategoryErrorState)
        {
          ToastConfig.showToast(msg: state.error.toString(), toastStates: ToastStates.Success);
        }
      },
      builder: (context,state){
        //Todo :var cubit = CategoryCubit.get(context);
        return Scaffold(
            drawer: SettingView(),
            appBar: AppBar(

              title: AppBarRow(),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Padding(
              padding: EdgeInsets.all(SizeConfig.defaultSize!*1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  VerticalSpace(value: 15,),

                  TextType("Categories"),

                  Container(
                    height: SizeConfig.defaultSize!*15,
                    child: ListViewSilver(category , (){
                      //AppNavigator.customNavigator(context: context, screen: SingleProductView(cubit.categories), finish: false);
                    }),
                  ),

                  TextType("Best Seller"),

                  Expanded(
                      child: ListViewWhite(category)
                  ),

                  TextType("All Item"),

                  Expanded(
                      child: ListViewWhite(category)
                  ),

                ],
              ),
            )
        );
      },
    );
  }
}
