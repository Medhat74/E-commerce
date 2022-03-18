import 'dart:async';

import 'package:e_commercy/core/utils/naviagtion.dart';
import 'package:e_commercy/core/utils/size_config.dart';
import 'package:e_commercy/services/sp_helper/cache_helper.dart';
import 'package:e_commercy/views/authentication/RegisteritonScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../homeScreen/home_view.dart';


class SplachScreen extends StatefulWidget {
  @override
  _SplachScreenState createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {

  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(

      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
        ),
      ),

    );
  }

  startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route() {

    String ?token = SharedPreferencesHelper.getData(key: 'token');
    if(token ==null) {
      AppNavigator.customNavigator(context: context, screen: RegestrationScreen(), finish: true);
    }
    else {
      AppNavigator.customNavigator(context: context, screen: HomeView(), finish: true);
    }
  }


}
