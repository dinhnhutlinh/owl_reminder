import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomePageControl extends GetxController {
  PageController controller = PageController();
  RxInt index = 0.obs;

  void changPage(int page) {
    index.value = page;
    controller.jumpToPage(page);
  }

  changeIndex(int page) {
    index.value = page;
  }
}
