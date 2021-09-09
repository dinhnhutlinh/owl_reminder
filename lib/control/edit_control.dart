import 'package:flutter/material.dart';
import 'package:owl_reminder/db/catetorytable.dart';
import 'package:owl_reminder/db/remindtable.dart';
import 'package:owl_reminder/model/remind.dart';

class EditControl {
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
  Remind? remind;
  EditControl(this.id) {
    onInit();
  }

  Future<void> onInit() async {
    remind = await remindTable.findRemindByID(this.id);
    titleControl.text = remind!.title;
    noteControl.text = remind!.note;
    time = TimeOfDay.fromDateTime(remind!.timeTask);
    dateTime = remind!.timeTask;
    location = remind!.location;
    repeat = remind!.repeat;
    timeBefore = remind!.timeBefore;
    category = remind!.category;
  }

  void setColor(Color color) {
    this.color = color;
  }

  void setDate(DateTime date) {
    this.dateTime = date;
  }
}
