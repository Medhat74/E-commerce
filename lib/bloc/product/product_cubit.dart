import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:e_commercy/models/product_hub.dart';
import 'package:e_commercy/services/dio_helper/dio_service.dart';
import 'package:e_commercy/services/sp_helper/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  static ProductHub? productHub;

  static ProductCubit get(context)=>BlocProvider.of(context);

  void getAllProductsInCategory(int id){
    emit(ProductLoadingState());

    DioHelper.getData(url: "product",
        token: SharedPreferencesHelper.getData(key: 'token'),
      query: {
        'category' : id
      }
    ).then((value) => (){
      print(value.data);
      var jsonData = jsonDecode(value.data);
      productHub = ProductHub.fromJson(jsonData);
      emit(ProductSuccessState());
    }).catchError((error){
      print(error);
      emit(ProductErrorState(error));
    });
  }

  void getProductByID(int id){
    DioHelper.getData(url: "products/$id",
        token: SharedPreferencesHelper.getData(key: 'token'),
    ).then((value) => (){
      print(value.data);
      var jsonData = jsonDecode(value.data);
      productHub = ProductHub.fromJson(jsonData);
      emit(ProductSuccessState());
    }).catchError((error){
      emit(ProductErrorState(error));
    });
  }

}
