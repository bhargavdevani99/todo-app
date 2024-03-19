import 'dart:convert';
import 'dart:developer';

import 'package:demo_project/apiservice/file_service.dart';
import 'package:demo_project/common/common_toast.dart';
import 'package:demo_project/model/todo_task_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  RxList<TodoTaskModel> todoData = <TodoTaskModel>[].obs;
  RxBool isLoading = true.obs;
  RxInt flotingButtonShowHide = 0.obs;

  final formkey = GlobalKey<FormState>();
  FileService fileService = FileService();

  Future taskAdd() async {
    var encodeData = jsonEncode({
      "title": titleController.value.text,
      "description": descriptionController.value.text,
    }).toString();
    Map<String, String> data = {
      "description": encodeData.toString(),
      "status": "false"
    };
    log("data === $data");
    await fileService.taskAdd(body: data).then((value) {
      commonToast("Todo add successfully");
      Get.back();
      descriptionController.clear();
      titleController.clear();
    }).onError((error, stackTrace) {
      commonToast(error.toString());
    });
  }

  Future taskUpdate(int id, String value) async {
    var encodeData = jsonEncode({
      "title": titleController.value.text,
      "description": descriptionController.value.text,
    }).toString();
    Map<String, String> data = {
      "description": encodeData.toString(),
      "status": value
    };
    log("data === $data");
    await fileService.taskUpdate(body: data, id: id).then((value) {
      commonToast("Todo Update successfully");
      Get.back();
      descriptionController.clear();
      titleController.clear();
    }).onError((error, stackTrace) {
      commonToast(error.toString());
    });
  }

  Future taskGet() async {
    await fileService.taskGet().then((List<TodoTaskModel> value) {
      todoData.value = value;
      todoData.refresh();
      log("fetch data $todoData");
      isLoading.value = false;
      descriptionController.clear();
      titleController.clear();
    }).onError((error, stackTrace) {
      commonToast(error.toString());
    });
  }

  Future taskDelete(id) async {
    await fileService.taskDelete(id: id).then((value) {
      commonToast("Todo delete successfully");
      Get.back();
      descriptionController.clear();
      titleController.clear();
    }).onError((error, stackTrace) {
      commonToast(error.toString());
    });
  }
}
