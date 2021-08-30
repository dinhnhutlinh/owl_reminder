import 'package:get/get.dart';
import 'package:owl_reminder/db/catetorytable.dart';
import 'package:owl_reminder/db/remindtable.dart';
import 'package:owl_reminder/model/remind.dart';

class TodayControl extends GetxController {
  RxList<String> categorys = <String>[].obs;
  RxString selectCategory = ''.obs;
  RxList<Remind> remindInDay = <Remind>[].obs;
  RemindTable _remindTable = RemindTable();
  CategoryTable _categoryTable = CategoryTable();
  @override
  void onInit() {
    super.onInit();
    categorys.add('Person');
    categorys.add('Word');
    getListCategory();
    getListRemindToday();
    // update();
  }

  Future<List<Remind>> getListRemindToday() async {
    return await _remindTable
        .getRemindInSelectDay(DateTime.now())
        .then((value) => remindInDay.value = value);
  }

  void getListCategory() {
    _categoryTable.getAllCategory().then(
          (value) => value.forEach(
            (category) => categorys.add(category),
          ),
        );
  }
}
