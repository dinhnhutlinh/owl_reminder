import 'package:get/get.dart';
import 'package:owl_reminder/model/remind.dart';
import 'package:table_calendar/table_calendar.dart';

class RemindControl extends GetxController {
  RxList<Remind> allRemind = <Remind>[].obs;

  List<Remind> getRemindInDay(DateTime day) =>
      allRemind.where((remind) => isSameDay(day, remind.timeTask)).toList();

  void addNewRemind() => allRemind.add(Remind(
      title: 'this is beatifull',
      category: 'Word',
      timeTask: DateTime.now().add(
        Duration(days: 2,hours: 3),
      )));

  List<DateTime> getAllDayHaveReminder() {
    List<DateTime> dates = [];
    allRemind.forEach((reminder) => dates.add(reminder.timeTask!));
    return dates;
  }
}
