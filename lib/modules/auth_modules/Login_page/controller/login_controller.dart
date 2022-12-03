import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:task/modules/auth_modules/Login_page/modal/login_modal.dart';
import 'package:task/modules/auth_modules/Login_page/service/login_service.dart';

class LoginController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Rx<LoginModal> loginModal = LoginModal().obs;
  RxBool isLoading = false.obs;

  Future userLoginMethod({
    required String username,
    required String password,
  }) async {
    print("-------1---------");
    try {
      isLoading.value = true;
      loginModal.value = await LoginService.getLoginData(
        username: username,
        password: password,
      );
      print("-------2---------");

      log("loginModal.value------------- 1 :${loginModal.value.data?.toJson()}");
      print("-------3---------");

      isLoading.value = false;
    } catch (e, st) {
      log("loginError-------------$e--------------$st");
    }
  }
}
