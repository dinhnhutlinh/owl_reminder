import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owl_reminder/db/catetorytable.dart';
import 'package:owl_reminder/db/remindtable.dart';
import 'package:owl_reminder/dialog/category_picker.dart';
import 'package:owl_reminder/dialog/color_picker.dart';
import 'package:owl_reminder/model/remind.dart';

class EditControl extends GetxController {
  TextEditingController titleControl = TextEditingController();
  TextEditingController noteControl = TextEditingController();
  RxString category = "".obs;
  TimeOfDay time = TimeOfDay(hour: 0, minute: 0);
  DateTime dateTime = DateTime.now();
  String location = "";
  Rx<Color> color = Colors.white.obs;
  int repeat = 0;
  int timeBefore = 5;
  RemindTable remindTable = RemindTable();
  CategoryTable categoryTable = CategoryTable();
  late Remind remind;

  @override
  Future<void> onInit() async {
    super.onInit();
    remind = await remindTable.findRemindByID(0);
    titleControl.text = remind.title;
    noteControl.text = remind.note;
    time = TimeOfDay.fromDateTime(remind.timeTask);
    dateTime = remind.timeTask;
    location = remind.location;
    repeat = remind.repeat;
    timeBefore = remind.timeBefore;
    category.value = remind.category == '' ? 'Work' : remind.category;
  }

  set setColor(Color color) {
    this.color.value = color;
  }

  void setDate(DateTime date) {
    this.dateTime = date;
  }

  Future<void> changeColor() async {
    var color = await Get.dialog(ColorPicker(this.color.value));
    if (color != null) this.color.value = color;
    update(['all']);
  }

  changCategory() async {
    String? t = await Get.dialog<String>(
      CategoryDiaLog(category.value),
    );
    if (t != null) category.value = t;
  }

  void setTime(TimeOfDay time) {
    this.time = time;
  }
}
