import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owl_reminder/db/remindtable.dart';
import 'package:owl_reminder/model/remind.dart';

class EditControl extends GetxController {
  TextEditingController titleControl = TextEditingController();
  TextEditingController noteControl = TextEditingController();
  String category = "";
  TimeOfDay time = TimeOfDay(hour: 0, minute: 0);
  DateTime dateTime = DateTime.now();
  String location = "";
  Color color = Colors.white;
  int repeat = 0;
  int timeBefore = 5;

  RemindTable remindTable = RemindTable();

  EditControl();

  @override
  void onInit() {
    
    super.onInit();
  }
}
