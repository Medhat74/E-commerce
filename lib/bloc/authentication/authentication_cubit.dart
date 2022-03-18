import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:e_commercy/models/login_hub.dart';
import 'package:e_commercy/services/dio_helper/dio_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  static AuthenticationCubit get(context)=>BlocProvider.of(context);
  AuthenticationHub? registerHub;



  void userRegister( {required String name , required String email , required String password}){
    emit(RegisterLoadingState());
    try {
      DioHelper.postData(url: 'register', data: {
        'name': name,
        'password': password,
        'email': email,
      }).then((value) {
        var jsonData=jsonDecode(value.data);
        registerHub = AuthenticationHub.fromJson(jsonData);
        emit(RegisterSuccessState(registerHub!));
      }).catchError((error){
        emit(RegisterErrorState(error));
        print(error.toString());
      });
    }
    catch (SocketConnection){
      emit(RegisterErrorState(SocketConnection));
    }
  }

  void userLogin({ required String email , required String password}){
    emit(LoginLoadingState());

    DioHelper.postData(url: 'login', data: {
      'password': password,
      'email': email,
    }).then((value) {
      var jsonData=jsonDecode(value.data);
      registerHub = AuthenticationHub.fromJson(jsonData);
      emit(LoginSuccessState(registerHub!));
    }).catchError((error){
      emit(LoginErrorState(error));
      print(error.toString());
    });
  }



}
