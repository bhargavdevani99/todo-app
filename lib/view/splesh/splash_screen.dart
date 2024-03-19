import 'package:demo_project/common/common_textstyle.dart';
import 'package:demo_project/utils/app_color.dart';
import 'package:demo_project/view/splesh/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashController splashController = Get.find<SplashController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashController.toLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "TO",
              style: AppTextStyle.styleW600.copyWith(fontSize: 30),
            ),
            Text(
              "DO",
              style: AppTextStyle.styleW600.copyWith(
                fontSize: 30,
                color: AppColors.kPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
