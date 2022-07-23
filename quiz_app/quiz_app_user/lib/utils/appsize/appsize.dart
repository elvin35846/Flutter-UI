import 'package:flutter/material.dart';

class AppSize {
  static double calculateHeight(BuildContext context, double designHeight) {
    const double designDeviceHeight = 812;
    double deviceHeight = MediaQuery.of(context).size.height;
    double res = (deviceHeight * height)/designDeviceHeight
    return res.toStringAsFixed(0);
  }

  static double calculateWidth(BuildContext context, double designWidth) {
    double phoneWidth = MediaQuery.of(context).size.width;

    return (phoneWidth * width) / 500;
  }
}



//int deviceHeight = 736;
//  int designHeight = 812;
//  double height = 50;
//  
//  double res = 0;
//  
//  res = (deviceHeight * height) / designHeight;
//  
//print(res.toStringAsFixed(0));