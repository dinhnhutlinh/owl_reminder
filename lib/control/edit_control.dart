import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owl_reminder/db/catetorytable.dart';
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
  int id;
  RemindTable remindTable = RemindTable();
  CategoryTable categoryTable = CategoryTable();
  late Remind remind;
  EditControl(this.id);

  @override
  Future<void> onInit() async {
    super.onInit();
    remind = await remindTable.findRemindByID(this.id);
    titleControl.text = remind.title;
    noteControl.text = remind.note;
   
  }
}
