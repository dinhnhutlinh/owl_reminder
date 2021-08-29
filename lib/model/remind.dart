import 'package:flutter/material.dart';
import 'package:owl_reminder/db/remindtable.dart';
import 'package:owl_reminder/main.dart';
import 'package:owl_reminder/style.dart';

class Remind {
  int? id;
  String title;
  String category;
  String note;
  String location;
  DateTime timeTask;
  int timeBefore;
  int repeat;
  bool isComplete = false;
  Color color;

  Remind(
      {this.id,
      required this.title,
      required this.category,
      this.note = "",
      this.location = "",
      required this.timeTask,
      this.timeBefore = 5,
      this.repeat = 0,
      this.color = Colors.white});

  Map<String, Object?> toJSon() => {
        RemindTable.ID: id,
        RemindTable.TITLE: title,
        RemindTable.CATEGORY: category,
        RemindTable.NOTE: note,
        RemindTable.LOCATION: location,
        RemindTable.COMPLETE: isComplete ? 1 : 0,
        RemindTable.REPEAT: repeat,
        RemindTable.TIMEBEFORE: timeBefore,
        RemindTable.COLOR: color.toString(),
        RemindTable.TIMETASK: timeTask.toString(),
      };

  static Remind fromJSon(Map<String, Object?> map) {
    return Remind(
      id: map[RemindTable.ID] as int?,
      category: map[RemindTable.CATEGORY] as String,
      title: map[RemindTable.TITLE] as String,
      timeTask: DateTime.parse(map[RemindTable.TIMETASK] as String),
      location: map[RemindTable.LOCATION] as String,
      repeat: map[RemindTable.REPEAT] as int,
      note: map[RemindTable.NOTE] as String,
      color: Color(map[RemindTable.COLOR] as int),
      timeBefore: map[RemindTable.TIMEBEFORE] as int,
    );
  }
}
