import 'package:admin/models/student_create_request_model.dart';
import 'package:admin/screens/home_page.dart';
import 'package:admin/utils/appsize/appsize.dart';
import 'package:admin/utils/network_util/network.dart';
import 'package:admin/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class CreateStudent extends StatefulWidget {
  const CreateStudent({Key? key}) : super(key: key);

  @override
  State<CreateStudent> createState() => _CreateStudentState();
}

class _CreateStudentState extends State<CreateStudent> {
  TextEditingController firstNameEditingController = TextEditingController();
  TextEditingController lastNameEditingController = TextEditingController();
  TextEditingController fatherNameEditingController = TextEditingController();
  TextEditingController phoneNumberEditingController = TextEditingController();
  TextEditingController finCodeEditingController = TextEditingController();
  TextEditingController teacherIdEditingController = TextEditingController();

  bool _validateFirstName = false;
  bool _validateLastName = false;
  bool _validateFatherName = false;
  bool _validatePhoneNumber = false;
  bool _validateFinCode = false;
  bool _validateTeacherId = false;
  bool _isLoading = false;
  @override
  void dispose() {
    super.dispose();
    firstNameEditingController.dispose();
    lastNameEditingController.dispose();
    fatherNameEditingController.dispose();
    phoneNumberEditingController.dispose();
    finCodeEditingController.dispose();
    teacherIdEditingController.dispose();
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
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          icon: Icon(
            Icons.keyboard_backspace_outlined,
            size: 30,
            color: textColor(),
          ),
        ),
        title: Text(
          "Telebe elave edin",
          style: TextStyle(color: textColor(), fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 30),
              Container(
                  width: (MediaQuery.of(context).size.width < 550)
                      ? AppSize.calculateWidth(context, 400)
                      : AppSize.calculateWidth(context, 200),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: buttonColor().withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 20, bottom: 15),
                    child: Column(children: [
                      CustomTextFieldWidget(
                        labelText: "Adi",
                        textEditingController: firstNameEditingController,
                        validate: _validateFirstName,
                        errorText: 'Bu xana bos qala bilmez',
                      ),
                      SizedBox(height: 10),
                      CustomTextFieldWidget(
                        labelText: "Soyad",
                        textEditingController: lastNameEditingController,
                        validate: _validateLastName,
                        errorText: 'Bu xana bos qala bilmez',
                      ),
                      SizedBox(height: 10),
                      CustomTextFieldWidget(
                        labelText: "Ata adi",
                        textEditingController: fatherNameEditingController,
                        validate: _validateFatherName,
                        errorText: 'Bu xana bos qala bilmez',
                      ),
                      SizedBox(height: 10),
                      CustomTextFieldWidget(
                        labelText: "Telefon",
                        textEditingController: phoneNumberEditingController,
                        validate: _validatePhoneNumber,
                        errorText: 'Bu xana bos qala bilmez',
                      ),
                      SizedBox(height: 10),
                      CustomTextFieldWidget(
                          labelText: 'Mellim id',
                          textInputType: TextInputType.number,
                          textEditingController: teacherIdEditingController,
                          validate: _validateTeacherId,
                          errorText: 'Buxana bos qala bilmez'),
                      SizedBox(height: 10),
                      CustomTextFieldWidget(
                        labelText: "Fin kod",
                        textEditingController: finCodeEditingController,
                        validate: _validateFinCode,
                        errorText:
                            (finCodeEditingController.text.isEmpty == true)
                                ? "Bu xana bos ola bilmez"
                                : "Fin kod 7 simvol olmalidi",
                        maxLength: 7,
                      ),
                      SizedBox(height: 12),
                      (_isLoading == false)
                          ? Container(
                              height: 50,
                              width: 150,
                              child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      firstNameEditingController.text.isEmpty
                                          ? _validateFirstName = true
                                          : _validateFirstName = false;
                                      lastNameEditingController.text.isEmpty
                                          ? _validateLastName = true
                                          : _validateLastName = false;
                                      fatherNameEditingController.text.isEmpty
                                          ? _validateFatherName = true
                                          : _validateFatherName = false;
                                      phoneNumberEditingController.text.isEmpty
                                          ? _validatePhoneNumber = true
                                          : _validatePhoneNumber = false;
                                      teacherIdEditingController.text.isEmpty
                                          ? _validateTeacherId = true
                                          : _validateTeacherId = false;
                                      (finCodeEditingController.text.isEmpty ||
                                              finCodeEditingController
                                                      .text.length !=
                                                  7)
                                          ? _validateFinCode = true
                                          : _validateFinCode = false;
                                      if (_validateFirstName == false &&
                                          _validateLastName == false &&
                                          _validateFatherName == false &&
                                          _validatePhoneNumber == false &&
                                          _validateFinCode == false &&
                                          _validateTeacherId == false) {
                                        createStudent();
                                      }
                                    });
                                  },
                                  child: Text(
                                    "Elave et",
                                    style: TextStyle(
                                        color: buttonColor(),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: buttonColor().withOpacity(0.25),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: buttonColor(), width: 1)),
                            )
                          : SpinKitFadingCircle(
                              color: buttonColor(),
                            )
                    ]),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  createStudent() async {
    setState(() {
      _isLoading = true;
    });
    StudentCreateRequestModel studentCreateRequestModel =
        StudentCreateRequestModel(
            firstName: firstNameEditingController.text,
            lastName: lastNameEditingController.text,
            fatherName: fatherNameEditingController.text,
            phoneNumber: phoneNumberEditingController.text,
            finNumber: finCodeEditingController.text,
            teacherId: int.parse(teacherIdEditingController.text));
    var response = await WebService.studentCreate(studentCreateRequestModel);
    if (response == true) {
      setState(() {
        _isLoading = false;
      });
      showTopSnackBar(
          context, CustomSnackBar.success(message: 'Ugurla elave edildi!'));
    } else {
      setState(() {
        _isLoading = false;
      });
      showTopSnackBar(
          context, CustomSnackBar.error(message: 'Xeta bas verdi!'));
    }
  }
}
