import 'package:e_commercy/services/dio_helper/dio_service.dart';
import 'package:e_commercy/services/sp_helper/cache_helper.dart';
import 'package:e_commercy/src/app_root.dart';
import 'package:flutter/material.dart';

Future<void> main()

async {

  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.init();
  DioHelper.init();
  runApp(AppRoot());
}