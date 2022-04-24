import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quiz_app_user/models/register_device_model.dart';
import 'package:quiz_app_user/screens/quiz_screen.dart';
import 'package:quiz_app_user/utils/appsize/appsize.dart';
import 'package:quiz_app_user/utils/network_util/network_util.dart';
import 'package:quiz_app_user/utils/themes/theme.dart';
import 'package:quiz_app_user/widgets/button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
//import 'package:flutter/services.dart';
import 'package:platform_device_id/platform_device_id.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({Key? key}) : super(key: key);

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  TextEditingController userFincodeController = TextEditingController();
  bool _isLoading = false;
  bool _validateUserFin = false;

  @override
  void dispose() {
    super.dispose();
    userFincodeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: (MediaQuery.of(context).size.width < 550)
                      ? AppSize.calculateWidth(context, 400)
                      : AppSize.calculateWidth(context, 200),
                  child: Column(
                    children: [
                      CustomTextFieldWidget(
                        labelText: 'İsdifadəçi Adı',
                        prefix: const Icon(
                          Icons.face,
                          color: Themes.primaryTextcolor,
                        ),
                        textEditingController: userFincodeController,
                        validate: _validateUserFin,
                        errorText: 'Bu xana boş qala bilməz',
                      ),
                      const SizedBox(height: 15),
                      (_isLoading == false)
                          ? SizedBox(
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, bottom: 25),
                                  child: CustomButtom(
                                    textButton: "Daxil OL",
                                    click: () {
                                      setState(() {
                                        if (userFincodeController
                                            .text.isEmpty) {
                                          _validateUserFin = true;
                                        } else {
                                          _validateUserFin = false;
                                        }
                                      });

                                      if (_validateUserFin == false) {
                                        login();
                                      }
                                    },
                                  )))
                          : const Center(child: CircularProgressIndicator()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  login() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isLoading = true;
    });
    var fin = userFincodeController.text;
    var deviceId = await PlatformDeviceId.getDeviceId;
    var deviceType = (Platform.isWindows == true ||
            Platform.isLinux == true ||
            Platform.isMacOS == true)
        ? 'pc'
        : 'mobile';
    //final bool? authorization = prefs.getBool('isRemember');
    debugPrint('fin: ' +
        fin +
        '\nd_id: ' +
        deviceId.toString() +
        '\nd_type: ' +
        deviceType);
    RegisterDeviceModel registerDeviceModel = RegisterDeviceModel(
      finNumber: fin,
      key: deviceId,
      keyType: deviceType,
    );
    var response = await WebService.signIn(registerDeviceModel, true);
    if (response == true) {
      setState(() {
        _isLoading = false;
      });
      debugPrint('Login is success');
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => QuizScreen()));
    } else {
      setState(() {
        _isLoading = false;
      });
      showTopSnackBar(
          context, const CustomSnackBar.error(message: "Xeta bas verdi!"));
    }
  }
}
