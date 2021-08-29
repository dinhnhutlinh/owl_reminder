import 'package:get/get.dart';
import 'package:owl_reminder/db/catetorytable.dart';
import 'package:owl_reminder/db/remindtable.dart';
import 'package:owl_reminder/model/remind.dart';

class TodayControl extends GetxController {
  RxList<String> categorys = <String>[].obs;
  RxString selectCategory = ''.obs;
  RxList<Remind> remindInDay = <Remind>[].obs;
  RemindTable _table = RemindTable();
  CategoryTable _categoryTable = CategoryTable();
  @override
  void onInit() {
    super.onInit();
    categorys.add('Person');
    categorys.add('Word');
    _table.add(Remind(category: 'iir', title: 'g', timeTask: DateTime.now()));
    getListRemindToday();
  }

  Future<List<Remind>> getListRemindToday() async {
    return await _table
        .getRemindInSelectDay(DateTime.now())
        .then((value) => remindInDay.value = value);
  }

  add(String category) {
    if (categorys.contains(category))
      print('c');
    else {
      categorys.add(category);
      _categoryTable.addCategory(category);
    }
  }
}
