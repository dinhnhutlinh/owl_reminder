import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owl_reminder/component/remind_card.dart';
import 'package:owl_reminder/control/calendercontrol.dart';
import 'package:table_calendar/table_calendar.dart';

// ignore: must_be_immutable
class CalenderPage extends StatelessWidget {
  CalenderControl calenderControl = Get.put(CalenderControl());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
          ),
          calendarFormat: CalendarFormat.twoWeeks,
          focusedDay: calenderControl.focusedDay.value,
          currentDay: DateTime.now(),
          firstDay: DateTime(2019),
          lastDay: DateTime(2099),
          holidayPredicate: (day) =>
              calenderControl.daysHaveRemind.contains(day),
          selectedDayPredicate: (day) =>
              isSameDay(day, calenderControl.selectedDay.value),
          onDaySelected: (selectedDay, focusedDay) {
            calenderControl.setSelectedDay(selectedDay);
            calenderControl.setForcuseDay(focusedDay);
          },
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(5),
            child: ListView.builder(
                itemCount: calenderControl.listRemindInDay.length,
                itemBuilder: (context, index) =>
                    RemindCard(calenderControl.listRemindInDay[index])),
          ),
        )
      ],
    );
  }
}
