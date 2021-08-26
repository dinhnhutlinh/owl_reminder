import 'package:get/get.dart';

class CalenderControl extends GetxController {
  Rx<DateTime> selectedDay = DateTime.now().obs;
  Rx<DateTime> focusedDay = DateTime.now().obs;

  void setSelectedDay(DateTime day) => selectedDay.value = day;
  void setForcuseDay(DateTime day) => focusedDay.value = day;
}
