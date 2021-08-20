import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owl_reminder/control/remind_control.dart';
import 'package:owl_reminder/model/remind.dart';
import 'package:owl_reminder/style.dart';
import 'package:owl_reminder/view/calender_remind.dart';
import 'package:owl_reminder/view/edit_remind.dart';
import 'package:owl_reminder/view/today_remind.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RemindControl remindControl = Get.put(RemindControl());
  int index = 0;
  List<Widget> pages = [
    TodayRemind(),
    CalenderRemind(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: pages[index],
      bottomNavigationBar: bottomBar(),
    );
  }

  Widget bottomBar() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
            color: darkGray, borderRadius: BorderRadius.circular(20)),
        height: 60,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  index = 0;
                });
              },
              icon: Icon(
                Icons.home,
                color: yellow,
                size: 30,
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                Get.to(
                  EditRemind(
                    Remind(
                        title: "",
                        category: "",
                        timeTask: DateTime.now().add(Duration(hours: 6))),
                  ),
                );
              },
              child: Icon(Icons.add),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  index = 1;
                });
              },
              icon: Icon(
                Icons.date_range,
                color: yellow,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
