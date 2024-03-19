import 'package:demo_project/common/commom_textfield.dart';
import 'package:demo_project/common/common_textstyle.dart';
import 'package:demo_project/utils/app_color.dart';
import 'package:demo_project/utils/route_string.dart';
import 'package:demo_project/view/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = Get.find<LoginController>();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kWhite,
        body: Form(
          key: formkey,
          child: Align(
            alignment: Alignment.center,
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  alignment: Alignment.center,
                  child: Text(
                    "Login",
                    style: AppTextStyle.styleW500.copyWith(
                      fontSize: 30,
                    ),
                  ),
                ),
                commonTextField(
                    controller: loginController.userController,
                    title: "Username",
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Please enter Username";
                      }
                      return null;
                    }),
                Obx(() {
                  return commonTextField(
                      controller: loginController.passwordController,
                      visibility: loginController.visibility.value,
                      visibilityShow: true,
                      title: "Password",
                      onTap: () {
                        loginController.visibility.value =
                            !loginController.visibility.value;
                      },
                      validator: (v) {
                        if (v!.isEmpty) {
                          return "Please enter password";
                        }
                        return null;
                      });
                }),
                const SizedBox(
                  height: 30,
                ),
                Obx(() {
                  return GestureDetector(
                    onTap: () {
                      if (loginController.isLoading.value == true) {
                        if (formkey.currentState!.validate()) {
                          loginController.login();
                        }
                      }
                    },
                    child: Container(
                      width: Get.width,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 10),
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.kPrimary,
                      ),
                      child: (loginController.isLoading.value)
                          ? Text(
                              "Login",
                              style: AppTextStyle.styleW500.copyWith(
                                fontSize: 17,
                                color: AppColors.kWhite,
                              ),
                            )
                          : const CircularProgressIndicator(
                              color: AppColors.kWhite,
                            ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () {
            Get.toNamed(RouteString.signupScreen);
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "New Here? ",
                  style: AppTextStyle.styleW400.copyWith(
                    fontSize: 16,
                  ),
                ),
                Text(
                  "Create Account",
                  style: AppTextStyle.styleW400.copyWith(
                    fontSize: 16,
                    color: AppColors.kPrimary,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
