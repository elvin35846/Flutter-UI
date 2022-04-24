import 'dart:convert';

import 'package:firstapp/models/get_student_model.dart';
import 'package:firstapp/models/user_model.dart';
import 'package:firstapp/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  static Future<List<GetStudentModel>> getStudents() async {
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    var res = await http.get(
      Uri.https(Urls.baseStudentUrl, Urls.getStudentUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        //'Authorization': 'Bearer ${prefs.getString('Authorization')}'
      },
    );

    if (res.statusCode == 200) {
      List jsonRes = json.decode(res.body);
      debugPrint('status code 200:' + jsonRes.toString());
      return jsonRes
          .map((student) => GetStudentModel.fromJson(student))
          .toList();
    } else {
      debugPrint(res.statusCode.toString());
      debugPrint(jsonDecode(res.body.toString())['detail']);
      return jsonDecode(res.body.toString())['detail'];
    }
  }

  static Future<List<UsersModel>> getUser() async {
    var res = await http.get(
      Uri.https(Urls.baseUrl, Urls.getUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (res.statusCode == 200) {
      List jsonRes = json.decode(res.body);
      //print('in Service' + jsonRes.toString());
      return jsonRes.map((e) => UsersModel.fromJson(e)).toList();
    } else {
      debugPrint(res.statusCode.toString());
      debugPrint(jsonDecode(res.body.toString())['detail']);
      return jsonDecode(res.body.toString())['detail'];
    }
  }
}
