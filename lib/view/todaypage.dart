import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owl_reminder/component/fill_button.dart';
import 'package:owl_reminder/component/remind_card.dart';
import 'package:owl_reminder/component/selecttag.dart';
import 'package:owl_reminder/control/category_control.dart';
import 'package:owl_reminder/control/todaycontrol.dart';
import 'package:owl_reminder/style.dart';

// ignore: must_be_immutable
class TodayPage extends StatelessWidget {
  TodayControl todayControl = Get.put(TodayControl());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectTCategory(
          onChange: (value) => todayControl.setSelected(value),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 5, 5, 0),
          child: Text('TODAY', style: titleStyle),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: todayControl.remindInDay.length,
            itemBuilder: (context, index) => RemindCard(
              todayControl.remindInDay[index],
            ),
          ),
        ),
      ],
    );
  }
}
