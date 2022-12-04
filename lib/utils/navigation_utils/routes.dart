import 'package:get/get.dart';
import 'package:task/modules/auth_page/Login_page/presentation/login_page.dart';
import 'package:task/modules/dashboard_modules/product_page/presentation/product_page.dart';

mixin Routes {
  static const defaultTransition = Transition.rightToLeft;

  static const String loginPage = "/loginPage";
  static const String productPage = "/productPage";

  static List<GetPage<dynamic>> routes = [
    GetPage<dynamic>(
      name: loginPage,
      page: () => LoginPage(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: productPage,
      page: () => ProductPage(),
      transition: defaultTransition,
    ),
  ];
}
