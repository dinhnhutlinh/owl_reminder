import 'package:get/get.dart';

class CategoryControl extends GetxController{
  RxList<String> categorys= <String>[].obs;
  RxString selectCategory= ''.obs;
  
  @override
  void onInit() {
    super.onInit();
    categorys.add('Person');
    categorys.add('Word');
  }
}