import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:lesson9/models/change_password_model.dart';
//import 'package:lesson9/models/change_student.dart';
import 'package:lesson9/models/login_request_model.dart';
import 'package:lesson9/utils/constants/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:lesson9/models/student_request_model.dart';

import 'package:http/http.dart' as http;

class WebService {
  static signIn(LoginRequestModel loginRequestModel, bool isRemember) async {
    final prefs = await SharedPreferences.getInstance();

    final response = await http.post(
      Uri.https(Urls.BASE_URL, Urls.LOGIN_URL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(loginRequestModel),
    );

    if (response.statusCode == 200) {
      await prefs.setString('Authorization',
          '${json.decode(response.body.toString())['access']}');
      if (isRemember) await prefs.setBool('isRemember', true);

      return true;
    } else {
      return json.decode(response.body.toString())['detail'];
    }
  }

  static changePassword(
      ChangePasswordRewuestModel changePasswordRewuestModel) async {
    final prefs = await SharedPreferences.getInstance();

    debugPrint(prefs.getString('Authorization'));
    final response = await http.put(
      Uri.https(Urls.BASE_URL, Urls.CHANGE_PASSWORD_URL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${prefs.getString('Authorization')}'
      },
      body: json.encode(changePasswordRewuestModel),
    );

    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
// Remove data for the 'counter' key.
      await prefs.remove('Authorization');
      return true;
    } else {
      return json.decode(response.body.toString())['detail'];
    }
  }
}
