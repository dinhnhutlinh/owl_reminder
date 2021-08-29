import 'package:get/get.dart';
import 'package:owl_reminder/db/remindtable.dart';
import 'package:owl_reminder/model/remind.dart';

class CalenderControl extends GetxController {
  Rx<DateTime> selectedDay = DateTime.now().obs;
  Rx<DateTime> focusedDay = DateTime.now().obs;
  RxList<Remind> listRemindInDay = <Remind>[].obs;
  RxList<DateTime> daysHaveRemind = <DateTime>[].obs;

  RemindTable _table = RemindTable();

  void setSelectedDay(DateTime day) => selectedDay.value = day;
  void setForcuseDay(DateTime day) => focusedDay.value = day;

  void remindInDay() {
    listRemindInDay.clear();
    _table
        .getRemindInSelectDay(selectedDay.value)
        .then((value) => listRemindInDay.value = value);
  }

  void dayHaveRemind() {
    _table.getDaysHaveRemind().then((value) => daysHaveRemind.value = value);
  }
}
