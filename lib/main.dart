import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:online_groceries_shop_app_flutter_admin/view/splash_view.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'common/color_extension.dart';
import 'common/my_http_overrides.dart';

SharedPreferences? prefs;

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp()
      // ChangeNotifierProvider( // Bọc ChangeNotifierProvider ở đây
      //   create: (context) => ReviewStateProvider(),
      //   child: const MyApp(),
      // ),
      );
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.ring
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 5.0
    ..progressColor = TColor.primaryText
    ..backgroundColor = TColor.primary
    ..indicatorColor = Colors.yellow
    ..textColor = TColor.primaryText
    ..userInteractions = false
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Online Groceries',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Gilroy",
        colorScheme: ColorScheme.fromSeed(seedColor: TColor.primary),
        useMaterial3: false,
      ),
      home: SplashView(),
      builder: (context, child) {
        return FlutterEasyLoading(child: child);
      },
    );
  }
}
