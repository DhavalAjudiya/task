import 'package:get/get.dart';
import 'package:task/modules/auth_modules/Login_page/presentation/login_page.dart';

mixin Routes {
  static const defaultTransition = Transition.rightToLeft;

  static const String loginPage = "/loginPage";

  static List<GetPage<dynamic>> routes = [
    GetPage<dynamic>(
      name: loginPage,
      page: () => LoginPage(),
      transition: defaultTransition,
    ),
  ];
}
