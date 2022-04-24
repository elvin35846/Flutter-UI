import 'package:counter_button/counter_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:teacher/screens/home_page_view.dart';
import 'package:teacher/utils/appsize/appsize.dart';
import 'package:teacher/utils/network_util/network_util.dart';
import 'package:teacher/widgets/button.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../models/student_request_model.dart';
import '../utils/themes/theme.dart';

class EditStudentView extends StatefulWidget {
  const EditStudentView({Key? key, required this.userName}) : super(key: key);

  final String userName;

  @override
  State<EditStudentView> createState() => _EditStudentViewState();
}

class _EditStudentViewState extends State<EditStudentView> {
  TextEditingController firstNameEditingController = TextEditingController();
  TextEditingController lastNameEditingController = TextEditingController();
  TextEditingController fatherNameEditingController = TextEditingController();
  TextEditingController phoneNumberEditingController = TextEditingController();
  TextEditingController finCodeEditingController = TextEditingController();

  bool _validateFirstName = false;
  bool _validateLastName = false;
  bool _validateFatherName = false;
  bool _validatePhoneNumber = false;
  bool _validateFinCode = false;
  bool _isLoading = false;
  bool _isActive = false;
  int pcCount = 0;
  int mobileCount = 0;
  bool mainLoading = false;
  int daysCount = 0;

  @override
  void initState() {
    getStudent(widget.userName);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    firstNameEditingController.dispose();
    lastNameEditingController.dispose();
    fatherNameEditingController.dispose();
    phoneNumberEditingController.dispose();
    finCodeEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.keyboard_backspace_outlined,
              size: 30,
              color: Themes.primaryTextcolor,
            ),
          ),
          title: Text(
            "Tələbə məlumatlarını yenilə",
            style: TextStyle(color: Themes.primaryTextcolor, fontSize: 24),
          ),
        ),
        body: (mainLoading == true)
            ? SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      Container(
                          width: (MediaQuery.of(context).size.width < 550)
                              ? AppSize.calculateWidth(context, 400)
                              : AppSize.calculateWidth(context, 200),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Themes.primaryColor.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18)),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(children: [
                              CustomTextFieldWidget(
                                labelText: "Adı",
                                textEditingController:
                                    firstNameEditingController,
                                validate: _validateFirstName,
                                errorText: 'Bu xana boş qala bilməz',
                              ),
                              SizedBox(height: 13),
                              CustomTextFieldWidget(
                                labelText: "Soyadı",
                                textEditingController:
                                    lastNameEditingController,
                                validate: _validateLastName,
                                errorText: 'Bu xana boş qala bilməz',
                              ),
                              SizedBox(height: 13),
                              CustomTextFieldWidget(
                                labelText: "Ata adı",
                                textEditingController:
                                    fatherNameEditingController,
                                validate: _validateFatherName,
                                errorText: 'Bu xana boş qala bilməz',
                              ),
                              SizedBox(height: 13),
                              CustomTextFieldWidget(
                                labelText: "Nömrəsi",
                                textEditingController:
                                    phoneNumberEditingController,
                                validate: _validatePhoneNumber,
                                errorText: 'Bu xana boş qala bilməz',
                              ),
                              SizedBox(height: 13),
                              CustomTextFieldWidget(
                                labelText: "Fin kodu",
                                textEditingController: finCodeEditingController,
                                validate: _validateFinCode,
                                errorText:
                                    (finCodeEditingController.text.isEmpty ==
                                            true)
                                        ? "Bu xana boş qala bilməz"
                                        : "Fin kod 7 simvol olmalıdı",
                                maxLength: 7,
                              ),
                              SizedBox(height: 13),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Themes.primaryColor)),
                                child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Aktivlik Statusu'),
                                      Switch(
                                          value: _isActive,
                                          onChanged: (value) {
                                            setState(() {
                                              _isActive = value;
                                            });
                                          })
                                    ]),
                              ),
                              SizedBox(height: 10),
                              CounterButton(
                                loading: false,
                                onChange: (int val) {
                                  setState(() {
                                    pcCount = val;
                                  });
                                },
                                count: pcCount,
                                countColor: Colors.purple,
                                buttonColor: Colors.purpleAccent,
                                progressColor: Colors.purpleAccent,
                              ),
                              SizedBox(height: 10),
                              CounterButton(
                                loading: false,
                                onChange: (int val) {
                                  setState(() {
                                    mobileCount = val;
                                  });
                                },
                                count: mobileCount,
                                countColor: Colors.purple,
                                buttonColor: Colors.purpleAccent,
                                progressColor: Colors.purpleAccent,
                              ),
                              SizedBox(height: 10),
                              CounterButton(
                                loading: false,
                                onChange: (int val) {
                                  setState(() {
                                    daysCount = val;
                                  });
                                },
                                count: daysCount,
                                countColor: Colors.purple,
                                buttonColor: Colors.purpleAccent,
                                progressColor: Colors.purpleAccent,
                              ),
                              SizedBox(height: 20),
                              (_isLoading == false)
                                  ? Container(
                                      height: 50,
                                      width: 150,
                                      child: TextButton(
                                          onPressed: () {
                                            setState(() {
                                              firstNameEditingController
                                                      .text.isEmpty
                                                  ? _validateFirstName = true
                                                  : _validateFirstName = false;
                                              lastNameEditingController
                                                      .text.isEmpty
                                                  ? _validateLastName = true
                                                  : _validateLastName = false;
                                              fatherNameEditingController
                                                      .text.isEmpty
                                                  ? _validateFatherName = true
                                                  : _validateFatherName = false;
                                              phoneNumberEditingController
                                                      .text.isEmpty
                                                  ? _validatePhoneNumber = true
                                                  : _validatePhoneNumber =
                                                      false;
                                              (finCodeEditingController
                                                          .text.isEmpty ||
                                                      finCodeEditingController
                                                              .text.length !=
                                                          7)
                                                  ? _validateFinCode = true
                                                  : _validateFinCode = false;
                                              if (_validateFirstName == false &&
                                                  _validateLastName == false &&
                                                  _validateFatherName ==
                                                      false &&
                                                  _validatePhoneNumber ==
                                                      false &&
                                                  _validateFinCode == false) {
                                                editStudentChange();
                                                print(
                                                    'editStudentChange calll');
                                              }
                                            });
                                          },
                                          child: Text(
                                            "Yenilə",
                                            style: TextStyle(
                                                color: Themes.primaryColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Themes.primaryColor
                                                  .withOpacity(0.25),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                              color: Themes.primaryColor,
                                              width: 1)),
                                    )
                                  : SpinKitFadingCircle(
                                      color: Themes.primaryColor)
                            ]),
                          )),
                    ],
                  ),
                ),
              )
            : Center(child: CircularProgressIndicator()));
  }

  getStudent(userName) async {
    var response = await WebService.getStudentWithUserName(userName);
    if (response != false) {
      setState(() {
        mainLoading = true;
        firstNameEditingController.text = response['first_name'];
        lastNameEditingController.text = response['last_name'];
        fatherNameEditingController.text = response['father_name'];
        phoneNumberEditingController.text = response['phone_number'];
        finCodeEditingController.text = response['username'];
        _isActive = response['is_active'];
        pcCount = response['allowed_pc_count'];
        mobileCount = response['allowed_mobile_count'];
        daysCount = response['remaining_days'];
      });
    } else {}
  }

  editStudentChange() async {
    setState(() {
      _isLoading = true;
    });
    StudentRequestModel studentRequestModel = StudentRequestModel(
        firstName: firstNameEditingController.text,
        lastName: lastNameEditingController.text,
        fatherName: fatherNameEditingController.text,
        phoneNumber: phoneNumberEditingController.text,
        username: finCodeEditingController.text,
        allowedMobileCount: mobileCount,
        allowedPcCount: pcCount,
        remainingDays: daysCount,
        isActive: _isActive);
    var response = await WebService.changeStudentData(
        studentRequestModel, widget.userName);
    if (response == true) {
      setState(() {
        _isLoading = false;
      });
      showTopSnackBar(context,
          CustomSnackBar.success(message: 'Telebe ugurla elave edildi!'));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      setState(() {
        _isLoading = false;
      });
      showTopSnackBar(
          context, CustomSnackBar.error(message: 'Xeta bas verdi!'));
    }
  }
}
