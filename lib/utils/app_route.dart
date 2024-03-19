import 'package:demo_project/utils/route_string.dart';
import 'package:demo_project/view/home/home_screen.dart';
import 'package:demo_project/view/login/login_screen.dart';
import 'package:demo_project/view/signup/signup_screen.dart';
import 'package:demo_project/view/splesh/splash_screen.dart';
import 'package:get/get.dart';

class AppRoute {
  static final routes = [
    GetPage(
      name: RouteString.splashScreen,
      page: () => const SplashScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: RouteString.signupScreen,
      page: () => const SignUpScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: RouteString.loginScreen,
      page: () => const LoginScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: RouteString.homeScreen,
      page: () => const HomeScreen(),
      transition: Transition.cupertino,
    ),
  ];
}
