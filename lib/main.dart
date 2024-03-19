import 'package:demo_project/utils/app_color.dart';
import 'package:demo_project/utils/app_route.dart';
import 'package:demo_project/utils/route_string.dart';
import 'package:demo_project/view/home/home_controller.dart';
import 'package:demo_project/view/login/login_controller.dart';
import 'package:demo_project/view/signup/signup_controller.dart';
import 'package:demo_project/view/splesh/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(SplashController());
  Get.put(SignupController());
  Get.put(LoginController());
  Get.put(HomeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Todo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.kPrimary),
        useMaterial3: true,
      ),
      initialRoute: RouteString.splashScreen,
      getPages: AppRoute.routes,
    );
  }
}
