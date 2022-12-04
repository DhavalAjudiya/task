import 'dart:convert';

import 'package:task/helper/network_helper.dart';
import 'package:task/modules/auth_page/Login_page/modal/login_modal.dart';
import 'package:task/res/appconfig.dart';

class LoginService {
  static final NetworkAPICall _networkAPICall = NetworkAPICall();

  static Future<LoginModal> getLoginData({
    required String username,
    required String password,
  }) async {
    final body = {
      "username": username,
      "password": password,
    };

    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=d672112chd0acai730g8d7960q'
    };

    try {
      final response = await _networkAPICall.post(
        AppConfig.loginUrl,
        json.encode(body),
        header: headers,
      );

      return loginModalFromJson(json.encode(response));
    } catch (e) {
      rethrow;
    }
  }
}
