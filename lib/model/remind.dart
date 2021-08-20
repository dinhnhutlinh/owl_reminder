import 'package:flutter/material.dart';
import 'package:owl_reminder/style.dart';

class Remind {
  int? id;
  String title;
  String category;
  String note;
  String location;
  DateTime timeTask;
  int notifiBefore;
  int repeat;
  bool isComplete = false;
  Color color;

  Remind(
      {required this.title,
      required this.category,
      this.note = "",
      this.location = "",
      required this.timeTask,
      this.notifiBefore = 5,
      this.repeat = 0,
      this.color = Colors.white});

  static Remind fromMap(Map<dynamic, dynamic> remind) {
    return Remind(
        title: remind['title'],
        category: remind['category'],
        timeTask: DateTime.parse(remind['timeTask']),
        notifiBefore: remind['notifiBefore'],
        note: remind['note'],
        location: remind['location'],
        color: Color(remind['color']))
      ..id = remind['id']
      ..isComplete = remind['isComplete'];
  }
}
