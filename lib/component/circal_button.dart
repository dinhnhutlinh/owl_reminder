import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owl_reminder/style.dart';

class CircleButton extends StatelessWidget {
  VoidCallback press;
  Widget widget;
  bool isFill;
  CircleButton(this.widget, this.press, this.isFill);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(right: 5, bottom: 5),
        width: Get.width * 0.175,
        height: Get.width * 0.175,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isFill ? Colors.yellow : Colors.transparent,
            border: Border.all(color: darkGray)),
        alignment: Alignment.center,
        child: widget,
      ),
    );
  }
}
