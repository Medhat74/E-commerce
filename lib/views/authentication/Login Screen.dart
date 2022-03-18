import 'package:e_commercy/bloc/authentication/authentication_cubit.dart';
import 'package:e_commercy/core/components/general_button.dart';
import 'package:e_commercy/core/components/space.dart';
import 'package:e_commercy/core/components/text_form_field.dart';
import 'package:e_commercy/core/toast/toast.dart';
import 'package:e_commercy/core/utils/naviagtion.dart';
import 'package:e_commercy/core/utils/size_config.dart';
import 'package:e_commercy/enums/ToostStates.dart';
import 'package:e_commercy/services/sp_helper/cache_helper.dart';
import 'package:e_commercy/src/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../homeScreen/home_view.dart';
import 'components/circle_icon.dart';
import 'components/my_text_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  static const IconData facebook = IconData(0xe255, fontFamily: 'MaterialIcons');
  static const IconData email = IconData(0xe22a, fontFamily: 'MaterialIcons');
  static const IconData tiktok = IconData(0xe22a, fontFamily: 'MaterialIcons');

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit,AuthenticationState>(
      listener: (context , state){
        if(state is LoginSuccessState)
        {

            SharedPreferencesHelper.saveData(key: 'token', value: state.registerHub.data!.accessToken).then((value) {
            AppNavigator.customNavigator(context: context, screen: HomeView(), finish: true);
            ToastConfig.showToast(msg: state.registerHub.message.toString(), toastStates: ToastStates.Success);
          });

        }

        if(state is LoginErrorState)
        {
          ToastConfig.showToast(msg: state.error.toString(), toastStates: ToastStates.Success);
        }
      },
      builder: (context,state){
        var cubit = AuthenticationCubit.get(context);
        return Scaffold(
            body: SingleChildScrollView(

              child: Container(
                height: SizeConfig.screenHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    VerticalSpace(value: 8),
                    Image.asset('assets/images/logo.png',),
                    VerticalSpace(value: 3),
                    Center(child: MyText( bold: true, color: AppColors.KPrimaryColor, fontSize: 30, text: 'Welcome Back')),
                    MyText(bold: false, fontSize:15, color: Colors.black,text: 'Please log in to your account'),

                    VerticalSpace(value: 4),
                    Form(
                      key: _formKey,
                      child: Center(
                        child: Container(
                          width:  SizeConfig.defaultSize! * 38,
                          height: SizeConfig.defaultSize! * 30,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextFormFieldComp(hint: "Email",icon: Icons.email, textInputType: TextInputType.emailAddress, textController: emailController),
                              TextFormFieldComp(hint: "Password",icon: Icons.lock,  textInputType: TextInputType.text, textController: passwordController ),
                              /// submit button
                              Container(
                                  width: SizeConfig.defaultSize!*36,
                                  child: GeneralButton("Continue" , (){
                                    cubit.userLogin(email: emailController.text.trim(), password: passwordController.text.trim());
                                  })
                              ),
                              if(state is LoginLoadingState)
                                LinearProgressIndicator()

                            ],
                          ),
                        ),
                      ),
                    ),

                    Container(
                      width: SizeConfig.defaultSize!*20,
                      child: Row(

                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleIcon(facebook),
                          HorizontalSpace(value: 2),
                          CircleIcon(email),
                          HorizontalSpace(value: 2),
                          CircleIcon(tiktok),
                        ],
                      ),
                    ),

                    VerticalSpace(value: 9),
                    MyText(fontSize: 15, bold: false, color: Colors.black, text: 'Already have an account ?'),

                    VerticalSpace(value: 1.5),

                    Expanded(
                        child: Container(
                            width: SizeConfig.screenWidth,
                            child: GeneralButton("Sign up" ,
                                    (){

                                  if (_formKey.currentState!.validate()) {
                                    cubit.userLogin(email : emailController.text,password : passwordController.text);


                                  }

                                }
                            )
                        )
                    ),
                  ],
                ),
              ),
            )
        );
    },

    );
  }
}