import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';

import '../style.dart';

class ColorPicker extends StatelessWidget {
  Color currentColor;
  ColorPicker(this.currentColor);
  List<Color> colors = [
    Color.fromRGBO(24, 255, 255, 100),
    Color.fromRGBO(77, 182, 172, 100),
    Color.fromRGBO(29, 233, 182, 100),
    Color.fromRGBO(124, 179, 66, 100),
    Color.fromRGBO(178, 255, 89, 100),
    Color.fromRGBO(230, 238, 156, 100),
    Color.fromRGBO(244, 255, 129, 100),
    Color.fromRGBO(255, 245, 157, 100),
    Color.fromRGBO(255, 255, 0, 100),
    Color.fromRGBO(255, 160, 0, 100),
    Color.fromRGBO(255, 112, 67, 100),
    Color.fromRGBO(255, 158, 128, 100),
    Color.fromRGBO(239, 154, 154, 100),
    Color.fromRGBO(255, 82, 82, 100),
    Color.fromRGBO(244, 143, 177, 100),
    Color.fromRGBO(255, 128, 171, 100),
    Color.fromRGBO(186, 104, 200, 100),
    Color.fromRGBO(170, 0, 255, 100),
    Color.fromRGBO(103, 58, 183, 100),
    Color.fromRGBO(101, 31, 255, 100),
    Color.fromRGBO(83, 109, 254, 100),
    Color.fromRGBO(66, 165, 245, 100),
    Color.fromRGBO(130, 177, 255, 100),
    Color.fromRGBO(64, 196, 255, 100),
    Color.fromRGBO(24, 255, 255, 100),
    Color.fromRGBO(77, 182, 172, 100),
    Color.fromRGBO(29, 233, 182, 100),
    Color.fromRGBO(124, 179, 66, 100),
    Color.fromRGBO(178, 255, 89, 100),
    Color.fromRGBO(230, 238, 156, 100),
    Color.fromRGBO(244, 255, 129, 100),
    Color.fromRGBO(255, 245, 157, 100),
    Color.fromRGBO(255, 255, 0, 100),
    Color.fromRGBO(255, 160, 0, 100),
    Color.fromRGBO(255, 112, 67, 100),
    Color.fromRGBO(255, 158, 128, 100),
    Color.fromRGBO(141, 110, 99, 100),
    Color.fromRGBO(158, 158, 158, 100),
    Color.fromRGBO(96, 125, 139, 100),
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: SizedBox(
        width: Get.width * 0.8,
        height: Get.height * 0.4,
        child: Column(
          children: [
            _title(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: GridView.count(
                  crossAxisCount: 4,
                  children: List.generate(
                      colors.length, (index) => colorCircle(index)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        color: yellow,
      ),
      alignment: Alignment.center,
      height: 45,
      child: Text('Select Color'),
    );
  }

  Widget colorCircle(int index) {
    return GestureDetector(
      onTap: () => Get.back(result: colors[index]),
      child: Container(
        margin: EdgeInsets.all(2),
        height: 45,
        width: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: colors[index], borderRadius: BorderRadius.circular(45)),
        child: colors[index] == currentColor ? LineIcon.check() : null,
      ),
    );
  }
}
