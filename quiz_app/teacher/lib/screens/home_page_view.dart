import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teacher/models/student_get_request_model.dart';
import 'package:teacher/screens/create_student_page_view.dart';
import 'package:teacher/screens/edit_student_view.dart';
import 'package:teacher/screens/password_change_page_view.dart';
import 'package:teacher/utils/network_util/network_util.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../utils/themes/theme.dart';
import 'login_page_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Themes.primaryColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "Tələbələrin Siyahısı",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton(
              iconSize: 30,
              color: Colors.white,
              itemBuilder: (context) {
                return [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Text("Şifrəni dəyiş",
                        style: TextStyle(color: Themes.primaryColor)),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Text("Çıxış",
                        style: TextStyle(color: Themes.primaryColor)),
                  ),
                ];
              },
              onSelected: (value) {
                if (value == 0) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PasswordChange()));
                } else if (value == 1) {
                  deleteAccesToken();
                }
              }),
        ],
      ),
      body: FutureBuilder<List<StudentGetRequestModel>>(
        future: WebService.getStudent(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            List<StudentGetRequestModel>? data = snapshot.data;
            return _getStudent(data);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Center(
              child: SpinKitCircle(
            size: 100,
            itemBuilder: (context, index) {
              final colors = [
                Themes.primaryColor,
                Themes.primaryTextcolor,
                Colors.indigo,
                Colors.blue
              ];
              final color = colors[index % colors.length];
              return DecoratedBox(
                  decoration:
                      BoxDecoration(color: color, shape: BoxShape.circle));
            },
          ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreateStudent()));
        },
        backgroundColor: Themes.primaryColor,
        child: Icon(
          Icons.add,
          size: 36,
        ),
        splashColor: Colors.indigo[800],
      ),
    );
  }

  deleteAccesToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('Authorization');
    await prefs.remove('isRemember');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginView()),
    );
  }

  ListView _getStudent(data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditStudentView(
                            userName: data[index].username,
                          )));
            },
            child: Card(
              elevation: 5,
              child: ListTile(
                title: Text(data[index].firstName + ' ' + data[index].lastName,
                    style: TextStyle(fontWeight: FontWeight.w600)),
                subtitle: Text(
                  data[index].username,
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                leading: CircleAvatar(
                    backgroundColor: Themes.primaryColor,
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
                trailing: IconButton(
                    onPressed: () {
                      showDataAlert(data[index].username);
                    },
                    icon: Icon(
                      Icons.delete_outline,
                      color: Colors.redAccent,
                    )),
              ),
            ),
          ),
        );
      },
    );
  }

  showDataAlert(username) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  10.0,
                ),
              ),
            ),
            title: Text(
              "Tələbəni silmək\nistəyirsiniz?",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22.0, color: Colors.redAccent),
            ),
            actions: [
              Center(
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Themes.primaryColor,
                  ),
                  onPressed: () {
                    deleteStudent(username);
                    Navigator.pop(context, 'OK');
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      'BƏLİ',
                      style: TextStyle(
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }

  deleteStudent(username) async {
    var response = await WebService.deleteStudentData(username);
    if (response == true) {
      setState(() {});
      showTopSnackBar(
          context, CustomSnackBar.success(message: 'Telebe ugurla silindi!'));
    } else {
      setState(() {});
      showTopSnackBar(
          context, CustomSnackBar.error(message: 'Xeta bas verdi!'));
    }
  }
}
