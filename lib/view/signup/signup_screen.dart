import 'dart:developer';

import 'package:demo_project/common/commom_textfield.dart';
import 'package:demo_project/common/common_textstyle.dart';
import 'package:demo_project/utils/app_color.dart';
import 'package:demo_project/utils/route_string.dart';
import 'package:demo_project/view/signup/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignupController signupController = SignupController();
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
                    "Signup",
                    style: AppTextStyle.styleW500.copyWith(
                      fontSize: 30,
                    ),
                  ),
                ),
                commonTextField(
                  title: "Username",
                  controller: signupController.userController,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Please enter Username";
                    }
                    return null;
                  },
                ),
                commonTextField(
                  title: "Email",
                  controller: signupController.emailController,
                  validator: (v) {
                    final bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(signupController.emailController.value.text);
                    if (v!.isEmpty) {
                      return "Please enter Email";
                    } else if (emailValid == false) {
                      return "Please enter Valid Email";
                    }
                    return null;
                  },
                ),
                Obx(() {
                  return commonTextField(
                    title: "Password",
                    visibility: signupController.visibility1.value,
                    visibilityShow: true,
                    onTap: () {
                      signupController.visibility1.value =
                          !signupController.visibility1.value;
                    },
                    controller: signupController.passController,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Please enter Password";
                      }
                      return null;
                    },
                  );
                }),
                Obx(() {
                  return commonTextField(
                    title: "Confirm Password",
                    visibility: signupController.visibility.value,
                    visibilityShow: true,
                    onTap: () {
                      signupController.visibility.value =
                          !signupController.visibility.value;
                    },
                    controller: signupController.confirmPasswordController,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Please enter Confirm Password";
                      } else if (v.toString() !=
                          signupController.passController.value.text) {
                        return "Password Same As Confirm Password";
                      }
                      return null;
                    },
                  );
                }),
                Obx(() {
                  return GestureDetector(
                    onTap: () {
                      if (signupController.isLoading.value == true) {
                        if (formkey.currentState!.validate()) {
                          signupController.createUser();
                        }
                      }
                      log("tap sign in");
                    },
                    child: Container(
                      width: Get.width,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(
                          left: 15, right: 15, top: 20, bottom: 10),
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.kPrimary,
                      ),
                      child: (signupController.isLoading.value)
                          ? Text(
                              "Signup",
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
            Get.toNamed(RouteString.loginScreen);
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: AppTextStyle.styleW400.copyWith(
                    fontSize: 16,
                  ),
                ),
                Text(
                  "Login",
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
