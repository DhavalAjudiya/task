import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:task/helper/toast_helper.dart';
import 'package:task/modules/auth_page/Login_page/modal/login_modal.dart';
import 'package:task/modules/auth_page/Login_page/service/login_service.dart';
import 'package:task/res/strings_utils.dart';
import 'package:task/utils/navigation_utils/navigation.dart';
import 'package:task/utils/navigation_utils/routes.dart';

class LoginController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  Rx<LoginModal> loginModal = LoginModal().obs;
  RxBool isLoading = false.obs;

  Future userLoginMethod({
    required String username,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      loginModal.value = await LoginService.getLoginData(
        username: username,
        password: password,
      );

      if (loginModal.value.statusCode == "200") {
        AppToast.toastMessage(AppString.loginSuccess);
        Navigation.pushNamed(Routes.productPage);
      } else {
        AppToast.toastMessage(AppString.loginFailed);
      }
    } catch (e, st) {
      log("loginError-------------$e--------------$st");
    } finally {
      isLoading.value = false;
    }
  }
}
