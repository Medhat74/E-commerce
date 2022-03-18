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
import 'Login Screen.dart';
import 'components/circle_icon.dart';
import 'components/my_text_field.dart';

class RegestrationScreen extends StatefulWidget {
  @override
  _RegisterationScreenState createState() => _RegisterationScreenState();
}

class _RegisterationScreenState extends State<RegestrationScreen> {
  final _formKey = GlobalKey<FormState>();
  static const IconData facebook = IconData(0xe255, fontFamily: 'MaterialIcons');
  static const IconData email = IconData(0xe22a, fontFamily: 'MaterialIcons');
  static const IconData tiktok = IconData(0xe22a, fontFamily: 'MaterialIcons');
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit,AuthenticationState>(
      listener: (context , state){
        if(state is RegisterSuccessState)
          {
            SharedPreferencesHelper.saveData(key: 'token', value: state.registerHub.data!.accessToken).then((value) {
              AppNavigator.customNavigator(context: context, screen: HomeView(), finish: true);
              ToastConfig.showToast(msg: state.registerHub.message.toString(), toastStates: ToastStates.Success);
            });

          }

        if(state is RegisterErrorState)
          {
            ToastConfig.showToast(msg: state.error.toString(), toastStates: ToastStates.Success);
          }
      },
      builder: (context , state){
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
                    Container(
                      width: SizeConfig.defaultSize!*31,
                      child: MyText( bold: true, color: AppColors.KPrimaryColor, fontSize: 30, text: 'Welcome to Portalite'),
                    ),
                    MyText(bold: false, fontSize:15, color: Colors.black,text: 'please sign up to join us'),

                    VerticalSpace(value: 4),
                    Form(
                      key: _formKey,
                      child: Center(

                        child: Container(
                          width:  SizeConfig.defaultSize! * 38,
                          height: SizeConfig.defaultSize! * 40,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextFormFieldComp(hint: "Name",icon: Icons.person ,textController: nameController , textInputType: TextInputType.text,),
                              TextFormFieldComp(hint: "Email",icon: Icons.email ,textController:  emailController , textInputType: TextInputType.emailAddress,),
                              TextFormFieldComp(hint : "Password",icon:  Icons.lock ,textController: passwordController,textInputType: TextInputType.text,),
                              TextFormFieldComp(hint: "Confirm Password",icon : Icons.lock ,textController:  confirmPasswordController , prevValue: passwordController.text, textInputType: TextInputType.text,),
                              Container(
                                  width: SizeConfig.defaultSize!*36,
                                  child: GeneralButton("Continue",
                                      (){

                                        if (_formKey.currentState!.validate()) {
                                          cubit.userRegister(name : nameController.text,email : emailController.text,password : passwordController.text);

                                        }

                                      }
                                  )
                              ),

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

                    VerticalSpace(value: 1.5),
                    MyText(fontSize: 15, bold: false, color: Colors.black, text: 'Already have an account ?'),

                    VerticalSpace(value: 1.5),

                    /// login button
                    Expanded(
                        child: Container(
                          width: SizeConfig.screenWidth,
                          child: GeneralButton("log in",(){

                            AppNavigator.customNavigator(context: context, screen: LoginScreen(), finish: true);


                          }),
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
