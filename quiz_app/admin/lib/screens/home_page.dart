import 'package:admin/screens/auth/login_view.dart';
import 'package:admin/screens/create_student.dart';
import 'package:admin/screens/create_teacher.dart';
import 'package:admin/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController oldPassordChangeEditingController =
      TextEditingController();
  TextEditingController newPassordChangeEditingController =
      TextEditingController();
  TextEditingController reNewPassordChangeEditingController =
      TextEditingController();

  bool _validateOldPassword = false;
  bool _validateNewPassword = false;
  bool _validateReNewPassword = false;
  bool _isLoading = false;
  bool renewErrorText = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    oldPassordChangeEditingController.text = "";
    newPassordChangeEditingController.text = "";
    reNewPassordChangeEditingController.text = "";
  }

  @override
  void dispose() {
    super.dispose();
    oldPassordChangeEditingController.dispose();
    newPassordChangeEditingController.dispose();
    reNewPassordChangeEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: buttonColor(),
          centerTitle: true,
          title: Text(
            'Siyahi',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          actions: [
            PopupMenuButton(
              iconSize: 30,
              color: Colors.white,
              itemBuilder: (context) {
                return [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Text("Şifrəni dəyiş",
                        style: TextStyle(color: buttonColor())),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child:
                        Text("Çıxış", style: TextStyle(color: buttonColor())),
                  ),
                ];
              },
              onSelected: (value) {
                if (value == 0) {
                  _dialog();
                } else if (value == 1) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginView()));
                }
              },
            ),
          ],
        ),
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: [
                DrawerHeader(
                  child: Image(image: AssetImage('assets/nisan.png')),
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    'Qeydiyyat',
                    style: TextStyle(color: textColor(), fontSize: 24),
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  elevation: 3,
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        "M",
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: buttonColor(),
                    ),
                    title: Text('Mellimler'),
                    subtitle: Text('Siyahisi'),
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    trailing: IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateTeacher()));
                        },
                        icon: Icon(Icons.add),
                        color: buttonColor(),
                        iconSize: 35),
                  ),
                ),
                SizedBox(height: 5),
                Card(
                  elevation: 3,
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text("T", style: TextStyle(color: Colors.white)),
                      backgroundColor: buttonColor(),
                    ),
                    title: Text('Telebeler'),
                    subtitle: Text('Siyahisi'),
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    trailing: IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateStudent()));
                        },
                        icon: Icon(
                          Icons.add,
                        ),
                        color: buttonColor(),
                        iconSize: 35),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _dialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(children: [
              CustomTextFieldWidget(
                  textEditingController: oldPassordChangeEditingController,
                  validate: _validateOldPassword,
                  errorText: "Bu xana bos qala bilmez",
                  hintText: "Kohne sifre"),
              SizedBox(height: 15),
              CustomTextFieldWidget(
                  textEditingController: newPassordChangeEditingController,
                  validate: _validateNewPassword,
                  errorText: "Bu xana bos qala bilmez",
                  hintText: "Yeni sifre"),
              SizedBox(height: 15),
              CustomTextFieldWidget(
                  textEditingController: reNewPassordChangeEditingController,
                  validate: _validateReNewPassword,
                  errorText: (renewErrorText == true)
                      ? "Bu xana bos qala bilmez"
                      : "Sifreleri eynilesdir!",
                  hintText: "Tekrar yeni sifre"),
            ]),
          ),
          actions: [
            (_isLoading == false)
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 5, right: 5),
                    child: Container(
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                        color: buttonColor(),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            oldPassordChangeEditingController.text.isEmpty
                                ? _validateOldPassword = true
                                : _validateOldPassword = false;
                            newPassordChangeEditingController.text.isEmpty
                                ? _validateNewPassword = true
                                : _validateNewPassword = false;
                            reNewPassordChangeEditingController.text.isEmpty
                                ? _validateReNewPassword = true
                                : _validateReNewPassword = false;
                            if (_validateOldPassword == false &&
                                _validateNewPassword == false &&
                                _validateReNewPassword == false) {
                              if (newPassordChangeEditingController.text ==
                                  reNewPassordChangeEditingController.text) {
                                setState(() {
                                  _isLoading = true;
                                });
                              }
                            }
                          });
                        },
                        child: Text(
                          'Deyis',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ))
                : SpinKitFadingCircle(
                    color: buttonColor(),
                  )
          ],
        );
      },
    );
  }
}
