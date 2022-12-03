import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task/res/app_colors.dart';
import 'package:task/utils/size_utils.dart';

class AppToast {
  static void toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      backgroundColor: AppColor.whiteColor,
      textColor: Colors.black,
      fontSize: SizeUtils.horizontalBlockSize * 3,
    );
  }
}
