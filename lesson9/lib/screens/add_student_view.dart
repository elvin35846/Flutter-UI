import 'package:flutter/material.dart';
import 'package:lesson9/models/student_request_model.dart';
import 'package:lesson9/utils/app_size/app_size.dart';
//import 'package:lesson9/utils/network_util/network_util.dart';
import 'package:lesson9/utils/themes/theme.dart';
import 'package:lesson9/widgets/custom_button_widget.dart';
import 'package:lesson9/widgets/custom_textfield_widget.dart';

class AddStudentView extends StatefulWidget {
  const AddStudentView({Key? key}) : super(key: key);

  @override
  State<AddStudentView> createState() => _AddStudentViewState();
}

class _AddStudentViewState extends State<AddStudentView> {
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
  final bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themes.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Themes.primaryColor.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    iconSize: 40,
                    icon: const Icon(
                      Icons.chevron_left_outlined,
                    ),
                    color: Themes.primaryColor,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ),
            Center(
                child: Container(
              width: (MediaQuery.of(context).size.width < 550)
                  ? AppSize.calculateWidth(context, 400)
                  : AppSize.calculateWidth(context, 200),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Themes.primaryColor.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ], color: Colors.white, borderRadius: BorderRadius.circular(18)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextFieldWidget(
                      textEditingController: firstNameEditingController,
                      validate: _validateFirstName,
                      errorText: "Bu xana boş qala bilməz",
                      hintText: "Adı",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFieldWidget(
                      textEditingController: lastNameEditingController,
                      validate: _validateLastName,
                      errorText: "Bu xana boş qala bilməz",
                      hintText: "Soyadı",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFieldWidget(
                      textEditingController: fatherNameEditingController,
                      validate: _validateFatherName,
                      errorText: "Bu xana boş qala bilməz",
                      hintText: "Ata adı",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFieldWidget(
                      textEditingController: phoneNumberEditingController,
                      validate: _validatePhoneNumber,
                      errorText: "Bu xana boş qala bilməz",
                      hintText: "Nömrə",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFieldWidget(
                      textEditingController: finCodeEditingController,
                      validate: _validateFinCode,
                      errorText: (finCodeEditingController.text.length == 0)
                          ? "Bu xana boş qala bilməz"
                          : 'Fin kod 7 simvol olmalıdır',
                      hintText: "Şəxsiyyət vəsiqəsinin fin kodu",
                      maxLength: 7,
                    ),
                    (_isLoading == false)
                        ? SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width * (0.20),
                            child: CustomButtonWidget(
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
                                  (finCodeEditingController.text.isEmpty ||
                                          finCodeEditingController
                                                  .text.length !=
                                              7)
                                      ? _validateFinCode = true
                                      : _validateFinCode = false;
                                });

                                if (_validateFirstName == false &&
                                    _validateLastName == false &&
                                    _validateFatherName == false &&
                                    _validateFinCode == false &&
                                    _validatePhoneNumber == false) {
                                  StudentRequestModel studentRequestModel =
                                      StudentRequestModel(
                                          firstName:
                                              firstNameEditingController.text,
                                          lastName:
                                              lastNameEditingController.text,
                                          fatherName:
                                              fatherNameEditingController.text,
                                          finNumber:
                                              finCodeEditingController.text,
                                          phoneNumber:
                                              phoneNumberEditingController
                                                  .text);
                                  // WebService.registerStudent(
                                  //     studentRequestModel);
                                }
                              },
                              buttonText: 'Əlavə Et',
                              textFontSize: 14,
                              textColor: Colors.white,
                              buttonBackgroundColor: Themes.primaryColor,
                              buttonBorderRadius: 10,
                              buttonSideColor: Themes.primaryColor,
                            ),
                          )
                        : const CircularProgressIndicator(
                            color: Themes.primaryColor,
                            strokeWidth: 2,
                          ),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
