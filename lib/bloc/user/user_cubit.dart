import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:e_commercy/models/user_hub.dart';
import 'package:e_commercy/services/dio_helper/dio_service.dart';
import 'package:e_commercy/services/sp_helper/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  static UserCubit get(context)=>BlocProvider.of(context);

  UserHub? user;

  void getUserProfile(){
    emit(UserLoadingState());
    DioHelper.getData(
        url: 'profile' ,
        token: SharedPreferencesHelper.getData(key: 'token')
    ).then((value) {
      var jsonData = jsonDecode(value.data);
      user = UserHub.fromJson(jsonData['data']['profile']);
      emit(UserSuccessState());
    }).catchError((error){
      emit(UserErrorState());
    });
  }


}
