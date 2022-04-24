import 'dart:convert';
import 'package:admin/models/login_request_model.dart';
import 'package:admin/models/student_create_request_model.dart';
import 'package:admin/models/teacher_create_request_model.dart';
import 'package:admin/utils/constans/urls.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class WebService {
    
    
  static signIn(LoginRequestModel loginRequestModel) async {
    final prefs = await SharedPreferences.getInstance();

    final response = await http.post(Uri.https(Urls.BASE_URL, Urls.LOGIN_URL),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(loginRequestModel));
    if (response.statusCode == 200) {
      await prefs.setString('Authorization',
          '${json.decode(response.body.toString())['access']}');
      return true;
    } else {
      return json.decode(response.body.toString())['detail'];
    }
  }

  static studentCreate(
      StudentCreateRequestModel studentCreateRequestModel) async {
    final prefs = await SharedPreferences.getInstance();
    final response =
        await http.post(Uri.https(Urls.BASE_URL, Urls.CREATE_STUDENT_URL),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization': 'Bearer ${prefs.getString('Authorization')}'
            },
            body: jsonEncode(studentCreateRequestModel));
    if (response.statusCode == 201) {
      return true;
    } else {
      return json.decode(response.body.toString())['detail'];
    }
  }

  static teacherCreate(
      TeacherCreateRequestModel teacherCreateRequestModel) async {
    final prefs = await SharedPreferences.getInstance();
    final response =
        await http.post(Uri.https(Urls.BASE_URL, Urls.Create_Teacher_URL),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization': 'Bearer ${prefs.getString('Authorization')}'
            },
            body: jsonEncode(teacherCreateRequestModel));
    if (response.statusCode == 201) {
      return true;
    } else {
      return json.decode(response.body.toString())['detail'];
    }
  }

  static getStudent() async {
    final response =
        await http.get(Uri.https(Urls.BASE_URL, Urls.CREATE_STUDENT_URL));
  }
}
