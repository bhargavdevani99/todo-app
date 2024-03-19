import 'dart:convert';

import 'package:demo_project/apiservice/api_service.dart';
import 'package:demo_project/model/todo_task_model.dart';
import 'package:demo_project/utils/api_string.dart';

class FileService {
  ApiService apiService = ApiService();

  Future signup({body}) async {
    final response =
        await apiService.postCall(body: body, url: ApiString.signupUrl);
    return response;
  }

  Future login({body}) async {
    final response =
        await apiService.postCall(body: body, url: ApiString.loginUrl);
    return response;
  }

  Future taskAdd({body}) async {
    final response =
        await apiService.postCall(body: body, url: ApiString.taskAddUrl);
    return response;
  }

  Future<List<TodoTaskModel>> taskGet() async {
    final response = await apiService.getCall(url: ApiString.taskGetUrl);
    return todoTaskModelFromJson(jsonEncode(response));
  }

  Future taskUpdate({body, required id}) async {
    final response = await apiService.putCall(
        body: body, url: "${ApiString.taskUpdateUrl}$id");
    return response;
  }

  Future taskDelete({required id}) async {
    final response =
        await apiService.deleteCall(url: "${ApiString.taskDeleteUrl}$id");
    return response;
  }
}
