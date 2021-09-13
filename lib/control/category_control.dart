import 'package:get/get.dart';
import 'package:owl_reminder/db/catetorytable.dart';

class CategoryControl extends GetxController {
  RxList categorys = [].obs;
  CategoryTable _table = CategoryTable();
  RxString selected = ''.obs;

  @override
  void onInit() {
    _table.getAllCategory().then((value) => categorys.value = value);
    super.onInit();
  }

  void setCategory(category) {
    selected.value = category;
  }
}
