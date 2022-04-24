import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app_user/models/register_device_model.dart';
import 'package:quiz_app_user/utils/constants/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WebService {
  static signIn(
      RegisterDeviceModel registerDeviceModel, bool isRemember) async {
    print('ishe dushdu isRemember-' + isRemember.toString());
    final prefs = await SharedPreferences.getInstance();
    final response = await http.post(
      Uri.https(Urls.BASE_URL, Urls.REGISTER_DEVICE_URL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(registerDeviceModel),
    );
    debugPrint('Response data: ' + response.body);
    if (response.statusCode == 200) {
      debugPrint('Response data: ' + response.body);
      // await prefs.setString('Authorization',
      //     '${json.decode(response.body.toString())['access']}');
      await prefs.setBool('isRememder', isRemember);
      return true;
    } else {
      debugPrint(json.decode(response.body.toString())['detail']);
      return false;
    }
  }
}
