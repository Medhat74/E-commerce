import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:e_commercy/models/category_hub.dart';
import 'package:e_commercy/services/dio_helper/dio_service.dart';
import 'package:e_commercy/services/sp_helper/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  static CategoryCubit get(context)=>BlocProvider.of(context);
  CategoryHub? categories ;

  void getCategories() {
    print ("first");
    print (SharedPreferencesHelper.getData(key: "token"));
    DioHelper.getData(
        url: 'categories',
        token:
        SharedPreferencesHelper.getData(key: "token")
    ).then((value) {
      print("secound");
      var jsonData=jsonDecode(value.data);
      print(jsonData);
      categories = CategoryHub.fromJson(jsonData);
      /*for(var category in categoriesHub!.data!)
      {
        categories.add(category);
      }*/
      emit(CategorySuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(CategoryErrorState(error));
    });
  }


}
