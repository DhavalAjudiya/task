import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/modules/auth_modules/Login_page/controller/login_controller.dart';
import 'package:task/utils/size_utils.dart';
import 'package:task/widget/custom_textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                controller: loginController.usernameController,
              ),
              CustomTextField(
                controller: loginController.passwordController,
              ),
              Obx(
                () => GestureDetector(
                  onTap: () {
                    loginController.userLoginMethod(
                      username: "ganesh@aiolos.solutions",
                      password: "ganesh@123",
                    );
                  },
                  child: CircleAvatar(
                    radius: SizeUtils.horizontalBlockSize * 10,
                    child: loginController.isLoading.value
                        ? const CircularProgressIndicator()
                        : const Icon(
                            Icons.arrow_forward,
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
