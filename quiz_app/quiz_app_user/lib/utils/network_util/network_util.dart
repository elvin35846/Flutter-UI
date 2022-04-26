import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app_user/models/register_device_model.dart';
import 'package:quiz_app_user/utils/constants/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WebService {
  static signIn(RegisterDeviceModel registerDeviceModel) async {
    final prefs = await SharedPreferences.getInstance();
    final response = await http.post(
      Uri.https(Urls.BASE_URL, Urls.REGISTER_DEVICE_URL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(registerDeviceModel),
    );
    if (response.statusCode == 200) {
      await prefs.setBool('isRemember', true);
      return true;
    } else {
      debugPrint(json.decode(response.body.toString())['detail']);
      return false;
    }
  }
}
//niye evvele qayitdi?