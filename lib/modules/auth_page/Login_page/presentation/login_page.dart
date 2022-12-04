import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:task/helper/snackbar_helper.dart';
import 'package:task/modules/auth_page/Login_page/controller/login_controller.dart';
import 'package:task/res/app_colors.dart';
import 'package:task/res/assets_path.dart';
import 'package:task/res/strings_utils.dart';
import 'package:task/res/validation_utils.dart';
import 'package:task/utils/size_utils.dart';
import 'package:task/widget/app_text.dart';
import 'package:task/widget/custom_textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: IntrinsicHeight(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AssetsPath.login1,
                color: AppColor.login_1,
              ),
              SizedBox(
                height: SizeUtils.horizontalBlockSize * 30,
              ),
              Center(
                child: GestureDetector(
                  onLongPress: () {
                    loginController.usernameController.text =
                        "ganesh@aiolos.solutions";
                    loginController.passwordController.text = "ganesh@123";
                  },
                  child: AppText(
                    AppString.login,
                    fontSize: SizeUtils.fSize_25(),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: SizeUtils.horizontalBlockSize * 10,
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.textField,
                          blurRadius: 3,
                          spreadRadius: 3,
                        ),
                      ],
                    ),
                    width: SizeUtils.horizontalBlockSize * 85,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                      child: Form(
                        key: loginController.loginFormKey,
                        child: Column(
                          children: [
                            CustomTextField(
                              controller: loginController.usernameController,
                              radius: 0,
                              validator: AppValidator.emailValidator,
                            ),
                            const Divider(
                              height: 0,
                              thickness: 0.5,
                            ),
                            CustomTextField(
                              controller: loginController.passwordController,
                              radius: 0,
                              validator: AppValidator.passwordValidator,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: SizeUtils.horizontalBlockSize * 5,
                    right: SizeUtils.horizontalBlockSize * -8,
                    child: Obx(
                      () => GestureDetector(
                        onTap: () async {
                          if (loginController.loginFormKey.currentState!
                              .validate()) {
                            await loginController.userLoginMethod(
                              username: loginController.usernameController.text,
                              password: loginController.passwordController.text,
                            );
                          } else {
                            AppSnackBar.showErrorSnackBar(
                                message: AppString.loginError,
                                title: AppString.error);
                          }
                        },
                        child: CircleAvatar(
                          backgroundColor: AppColor.login_2,
                          radius: SizeUtils.horizontalBlockSize * 10,
                          child: loginController.isLoading.value
                              ? SpinKitSquareCircle(
                                  color: AppColor.headerTextColor,
                                  size: SizeUtils.horizontalBlockSize * 11,
                                )
                              : Image.asset(
                                  AssetsPath.loginIcon,
                                  color: AppColor.whiteColor,
                                  height: SizeUtils.horizontalBlockSize * 12,
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: SizeUtils.verticalBlockSize * 2,
                  left: SizeUtils.horizontalBlockSize * 40,
                ),
                child: AppText(
                  AppString.forgetPassword,
                  fontSize: SizeUtils.fSize_17(),
                  fontWeight: FontWeight.w500,
                  color: AppColor.blackColor.withOpacity(0.1),
                ),
              ),
              SizedBox(
                height: SizeUtils.horizontalBlockSize * 16,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.textField,
                      blurRadius: 3,
                      spreadRadius: 3,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: SizeUtils.horizontalBlockSize * 3,
                      horizontal: SizeUtils.horizontalBlockSize * 5),
                  child: AppText(
                    AppString.register,
                    fontSize: SizeUtils.fSize_17(),
                    fontWeight: FontWeight.w600,
                    color: AppColor.register,
                  ),
                ),
              ),
              SizedBox(
                height: SizeUtils.horizontalBlockSize * 21.8,
              ),
              Image.asset(
                AssetsPath.login2,
                color: AppColor.login_2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
