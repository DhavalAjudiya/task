import 'dart:convert';

import 'package:task/helper/network_helper.dart';
import 'package:task/modules/auth_modules/Login_page/modal/login_modal.dart';
import 'package:task/res/appconfig.dart';

class LoginService {
  static final NetworkAPICall _networkAPICall = NetworkAPICall();

  static Future<LoginModal> getLoginData({
    String? username,
    String? password,
  }) async {
    final body = {
      "username": username,
      "password": password,
    };
    final header = {"Connection": "keep-alive"};
    try {
      final response = await _networkAPICall.post(
        AppConfig.loginUrl,
        json.encode(body),
        header: header,
      );
      print("response------${response}");
      return LoginModal.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
