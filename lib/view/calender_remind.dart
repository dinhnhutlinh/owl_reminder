import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owl_reminder/component/remind_card.dart';
import 'package:owl_reminder/control/calender_control.dart';
import 'package:owl_reminder/control/remind_control.dart';
import 'package:owl_reminder/model/remind.dart';
import 'package:owl_reminder/style.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderRemind extends StatelessWidget {
  CalenderControl control = Get.put(CalenderControl());
  RemindControl remindControl = Get.put(RemindControl());
  List<Remind> get remindInDay =>
      remindControl.getRemindInDay(control.selectedDay.value);
  List<DateTime> get dayHaveRemind => remindControl.getAllDayHaveReminder();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          TableCalendar(
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
            ),
            calendarFormat: CalendarFormat.twoWeeks,
            focusedDay: control.focusedDay.value,
            currentDay: DateTime.now(),
            firstDay: DateTime(2019),
            lastDay: DateTime(2099),
            holidayPredicate: (day) {
              var isHoliday = false;
              dayHaveRemind.forEach((dayRemind) {
                if (isSameDay(dayRemind, day)) isHoliday = true;
              });
              return isHoliday;
            },
            selectedDayPredicate: (day) =>
                isSameDay(day, control.selectedDay.value),
            onDaySelected: (selectedDay, focusedDay) {
              control.setSelectedDay(selectedDay);
              control.setForcuseDay(focusedDay);
            },
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(5),
              child: ListView.builder(
                  itemCount: remindInDay.length,
                  itemBuilder: (context, index) =>
                      RemindCard(remindInDay[index])),
            ),
          )
        ],
      ),
    );
  }
}
