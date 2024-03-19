import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:demo_project/utils/app_session.dart';
import 'package:demo_project/utils/session_key.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<Map<String, String>> getHeaders() async {
    final String? token = await getDataFromLocalStorage(
        dataType: "STRING", prefKey: SessionKey.token);
    log("Token -- '$token'");
    return {
      // 'Content-type': 'application/json',
      if (token != null) 'x-access-token': token,
    };
  }

  Future postCall({body, url}) async {
    var header = await getHeaders();
    log("post call status code =  $url  $body");
    try {
      http.Response response =
          await http.post(Uri.parse(url), body: body, headers: header);
      log("response post call status code =  ${response.statusCode}");
      log("response post call body =  ${response.body}");
      final json = responseData(response);
      return json;
    } on SocketException {
      throw Exception("Check your internet");
    } catch (e) {
      throw Exception(e);
    }
  }

  Future getCall({url}) async {
    var header = await getHeaders();
    log("get call status code =  $url");
    try {
      http.Response response = await http.get(Uri.parse(url), headers: header);
      log("response get call status code =  ${response.statusCode}");
      log("response get call body =  ${response.body}");
      final json = responseData(response);
      return json;
    } on SocketException {
      throw Exception("Check your internet");
    } catch (e) {
      throw Exception(e);
    }
  }

  Future putCall({body, url}) async {
    var header = await getHeaders();
    log("put call status code =  $url  $body");
    try {
      http.Response response =
          await http.put(Uri.parse(url), body: body, headers: header);
      log("response put call status code =  ${response.statusCode}");
      log("response put call body =  ${response.body}");
      final json = responseData(response);
      return json;
    } on SocketException {
      throw Exception("Check your internet");
    } catch (e) {
      throw Exception(e);
    }
  }

  Future deleteCall({url}) async {
    var header = await getHeaders();
    log("delete call status code =  $url");
    try {
      http.Response response =
          await http.delete(Uri.parse(url), headers: header);
      log("response delete call status code =  ${response.statusCode}");
      log("response delete call body =  ${response.body}");
      final json = responseData(response);
      return json;
    } on SocketException {
      throw Exception("Check your internet");
    } catch (e) {
      throw Exception(e);
    }
  }

  responseData(http.Response response) {
    switch (response.statusCode) {
      case 200:
        final json = jsonDecode(response.body);
        return json;
      case 400:
        final json = jsonDecode(response.body);
        return json;
      default:
        var json = jsonDecode(response.body);
        return json;
    }
  }
}
