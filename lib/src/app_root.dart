import 'package:e_commercy/bloc/authentication/authentication_cubit.dart';
import 'package:e_commercy/bloc/cart/cart_cubit.dart';
import 'package:e_commercy/bloc/category/category_cubit.dart';
import 'package:e_commercy/bloc/product/product_cubit.dart';
import 'package:e_commercy/bloc/user/user_cubit.dart';
import 'package:e_commercy/views/splashScreens/SplachScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => AuthenticationCubit(),),
        BlocProvider(create: (BuildContext context) => CategoryCubit()..getCategories(),),
        BlocProvider(create: (BuildContext context) => ProductCubit()),
        BlocProvider(create: (BuildContext context) => CartCubit()),
        BlocProvider(create: (BuildContext context) => UserCubit()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplachScreen(),
      ),
    );
  }
}