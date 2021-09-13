import 'package:get/get.dart';
import 'package:owl_reminder/db/remindtable.dart';
import 'package:owl_reminder/model/remind.dart';

class TodayControl extends GetxController {
  RxString selectCategory = ''.obs;
  RxList<Remind> remindInDay = <Remind>[].obs;
  RemindTable _remindTable = RemindTable();
  // CategoryTable _categoryTable = CategoryTable();
  @override
  void onInit() {
    super.onInit();
    // getListCategory();
    getListRemindToday();
  }

  Future<List<Remind>> getListRemindToday() async {
    return await _remindTable
        .getRemindInSelectDay(DateTime.now())
        .then((value) => remindInDay.value = value);
  }

  setSelected(String value) {
    selectCategory.value = value;
  }
}
