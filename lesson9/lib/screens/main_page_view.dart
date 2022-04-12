import 'package:flutter/material.dart';
import 'package:lesson9/models/change_password_model.dart';
import 'package:lesson9/screens/add_student_view.dart';
import 'package:lesson9/screens/auth/login_view.dart';
import 'package:lesson9/utils/network_util/network_util.dart';
import 'package:lesson9/utils/themes/theme.dart';
import 'package:lesson9/widgets/custom_textfield_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  TextEditingController firstNameEditingController = TextEditingController();
  TextEditingController lastNameEditingController = TextEditingController();
  TextEditingController fatherNameEditingController = TextEditingController();
  TextEditingController phoneNumberEditingController = TextEditingController();
  TextEditingController finCodeEditingController = TextEditingController();

  TextEditingController oldPasswordEditingController = TextEditingController();
  TextEditingController newPasswordEditingController = TextEditingController();
  TextEditingController reNewPasswordEditingController =
      TextEditingController();

  bool _validateFirstName = false;
  bool _validateLastName = false;
  bool _validateFatherName = false;
  bool _validatePhoneNumber = false;
  bool _validateFinCode = false;
  bool _validateOldPassword = false;
  bool _validateNewPassword = false;
  bool _validateReNewPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Themes.primaryColor,
        actions: [
          PopupMenuButton(
              // add icon, by default "3 dot" icon
              // icon: Icon(Icons.book)
              itemBuilder: (context) {
            return const [
              PopupMenuItem<int>(
                value: 0,
                child: Text("Şifrəni dəyiş"),
              ),
              PopupMenuItem<int>(
                value: 1,
                child: Text("Çıxış"),
              ),
            ];
          }, onSelected: (value) {
            if (value == 0) {
              _showMyDialog();
            } else if (value == 1) {
              removeAccessToken();
            }
          }),
        ],
      ),
      backgroundColor: Themes.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Table(
          children: [
            const TableRow(children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Ad',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'SoyAd',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Ata adı',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Fin',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Aktiv',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ]),
            TableRow(children: [
              SizedBox(
                height: 50,
                width: 180,
                child: CustomTextFieldWidget(
                  textEditingController: lastNameEditingController,
                  validate: _validateLastName,
                  errorText: "Bu xana boş qala bilməz",
                  hintText: "ad",
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                height: 50,
                width: 180,
                child: CustomTextFieldWidget(
                  textEditingController: lastNameEditingController,
                  validate: _validateLastName,
                  errorText: "Bu xana boş qala bilməz",
                  hintText: "soyad",
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                height: 50,
                width: 180,
                child: CustomTextFieldWidget(
                  textEditingController: lastNameEditingController,
                  validate: _validateLastName,
                  errorText: "Bu xana boş qala bilməz",
                  hintText: "Ata adı",
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                height: 50,
                width: 180,
                child: CustomTextFieldWidget(
                  textEditingController: lastNameEditingController,
                  validate: _validateLastName,
                  errorText: "Bu xana boş qala bilməz",
                  hintText: "Ata adı",
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                      height: 50,
                      child: Switch(
                        activeTrackColor: Themes.primaryColor,
                        activeColor: Themes.primaryColor,
                        onChanged: (value) {},
                        value: true,
                      )),
                ),
              ),
            ]),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Themes.primaryColor,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddStudentView()));
        },
        label: const Text('Tələbə Qeydiyyatı'),
        icon: const Icon(Icons.add),
      ),
    );
  }

  removeAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    // Remove data for the 'counter' key.
    await prefs.remove('Authorization');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginView()),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                CustomTextFieldWidget(
                    textEditingController: oldPasswordEditingController,
                    validate: _validateOldPassword,
                    errorText: 'Bu xana boş qala bilməz',
                    hintText: 'Köhnə şifrə'),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFieldWidget(
                    textEditingController: newPasswordEditingController,
                    validate: _validateNewPassword,
                    errorText: 'Bu xana boş qala bilməz',
                    hintText: 'Yeni şifrə'),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFieldWidget(
                    textEditingController: reNewPasswordEditingController,
                    validate: _validateReNewPassword,
                    errorText: 'Bu xana boş qala bilməz',
                    hintText: 'Təkrar yeni şifrə'),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Dəyiş'),
              onPressed: () {
                changePassword();
              },
            ),
          ],
        );
      },
    );
  }

  changePassword() async {
    oldPasswordEditingController.text.isEmpty
        ? _validateOldPassword = true
        : _validateOldPassword = false;
    newPasswordEditingController.text.isEmpty
        ? _validateNewPassword = true
        : _validateNewPassword = false;
    reNewPasswordEditingController.text.isEmpty
        ? _validateReNewPassword = true
        : _validateReNewPassword = false;

    if (_validateOldPassword == false &&
        _validateNewPassword == false &&
        _validateReNewPassword == false) {
      if (reNewPasswordEditingController.text ==
          newPasswordEditingController.text) {
        ChangePasswordRewuestModel changePasswordRewuestModel =
            ChangePasswordRewuestModel(
          oldPassword: oldPasswordEditingController.text,
          newPassword: newPasswordEditingController.text,
        );
        var response =
            await WebService.changePassword(changePasswordRewuestModel);

        if (response == true) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginView()),
          );
        }
      }
    }
  }
}
