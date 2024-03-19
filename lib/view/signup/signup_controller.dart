import 'package:demo_project/apiservice/file_service.dart';
import 'package:demo_project/common/common_toast.dart';
import 'package:demo_project/utils/route_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  RxBool isLoading = true.obs;
  RxBool visibility = true.obs;
  RxBool visibility1 = true.obs;

  FileService fileService = FileService();

  Future createUser() async {
    isLoading.value = false;
    Map<String, String> data = {
      "username": userController.value.text,
      "email": emailController.value.text,
      "password": confirmPasswordController.value.text
    };
    await fileService.signup(body: data).then((value) {
      isLoading.value = true;
      commonToast(value['message']);
      if (value['message'].toString() == "User was registered successfully!") {
        Get.toNamed(RouteString.loginScreen);
        userController.clear();
        emailController.clear();
        passController.clear();
        confirmPasswordController.clear();
      }
    }).onError((error, stackTrace) {
      isLoading.value = true;
      commonToast(error.toString());
    });
  }
}
