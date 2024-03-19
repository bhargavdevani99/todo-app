import 'package:demo_project/utils/app_session.dart';
import 'package:demo_project/utils/route_string.dart';
import 'package:demo_project/utils/session_key.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  toLogin() async {
    var token = await getDataFromLocalStorage(
        dataType: "STRING", prefKey: SessionKey.token);
    Future.delayed(const Duration(seconds: 3)).then(
      (value) => Get.offAllNamed(
          (token != null) ? RouteString.homeScreen : RouteString.loginScreen),
    );
  }
}
