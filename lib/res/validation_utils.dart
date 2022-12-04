import 'package:task/helper/exception_handler.dart';
import 'package:task/res/strings_utils.dart';

class AppValidator {
  AppValidator._();

  static String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return AppString.plzEnterEmail;
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return AppString.plzEnterPWD;
    }
    return null;
  }
}
