import 'package:flutter/material.dart';

class AppString {
  AppString._();

  static ValueNotifier<int> bottomIndex = ValueNotifier(0);

  ///Validator

  static const String plzEnterEmail = 'Please enter email';
  static const String plzEnterPWD = 'Please enter Password';

  static const String login = "Login";
  static const String forgetPassword = "ForgotPassword?";
  static const String register = "Register";
  static const String loginSuccess = "Login success!";
  static const String loginFailed = "Login failed!";
  static const String loginError = "All Field Are Required";
  static const String error = "Error";
  static const String nykaa = "nykaa";
  static const String NKB = "Nykaa Korean Beauty";
  static const String product = " product";
  static const String sheetMasks = "Sheet Masks";
  static const String masks = "Masks & Peels";
  static const String sleepingMasks = "Sleeping Masks";
  static const String noProduct = "Product Is Not Available";
  static const String descount = "Discount ";
  static const String bestSeller = "BestSeller";
  static const String featured = "FEATURED";
  static const String noRating = "No Rating";
}
