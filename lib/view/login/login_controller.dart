import 'package:demo_project/apiservice/file_service.dart';
import 'package:demo_project/common/common_toast.dart';
import 'package:demo_project/utils/app_session.dart';
import 'package:demo_project/utils/route_string.dart';
import 'package:demo_project/utils/session_key.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isLoading = true.obs;
  RxBool visibility = true.obs;

  FileService fileService = FileService();

  Future login() async {
    isLoading.value = false;
    Map<String, String> data = {
      "username": userController.value.text,
      "password": passwordController.value.text
    };
    await fileService.login(body: data).then((value) {
      isLoading.value = true;
      if (value['accessToken'] != null) {
        commonToast("Login Successfully");
        setDataToLocalStorage(
            dataType: "STRING",
            prefKey: SessionKey.token,
            stringData: value['accessToken'].toString());
        Get.offAllNamed(RouteString.homeScreen);
        userController.clear();
        passwordController.clear();
      } else {
        commonToast(value['message']);
      }
    }).onError((error, stackTrace) {
      isLoading.value = true;
      commonToast(error.toString());
    });
  }
}
