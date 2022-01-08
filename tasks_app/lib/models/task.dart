import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasks_app/constants/colors.dart';

class Task {
  IconData? iconData;
  String? titile;
  Color? bgColor;
  Color? iconColor;
  Color? btnColor;
  bool? isLast;
  num? left;
  num? done;

  Task({
    this.iconData,
    this.titile,
    this.bgColor,
    this.iconColor,
    this.btnColor,
    this.isLast = false,
    this.left,
    this.done,
  });

  static List<Task> taskGenerate() {
    return [
      Task(
        iconData: Icons.person_rounded,
        titile: 'Personal',
        bgColor: kYellowLight,
        iconColor: kYellowDark,
        btnColor: kYellow,
        left: 3,
        done: 1,
      ),
      Task(
        iconData: Icons.cases_rounded,
        titile: 'Work',
        bgColor: kRedLight,
        iconColor: kRedDark,
        btnColor: kRed,
        left: 0,
        done: 0,
      ),
      Task(
        iconData: Icons.favorite_rounded,
        titile: 'Health',
        bgColor: kBlueLight,
        iconColor: kBlueDark,
        btnColor: kBlue,
        left: 1,
        done: 1,
      ),
      Task(isLast: true),
    ];
  }
}
