import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RepeatDialog extends StatelessWidget {
  int repeat;
  RepeatDialog(this.repeat);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select Repeat'),
      content: SizedBox(
        height: Get.height * 0.25,
        child: ListView(
          children: [
            ListTile(
              title: Text('No repeats'),
              onTap: () => Get.back(result: 0),
            ),
            ListTile(
              title: Text('Every Day'),
              onTap: () => Get.back(result: 1),
            ),
            ListTile(
              title: Text('Every Week'),
              onTap: () => Get.back(result: 7),
            ),
            ListTile(
              title: Text('Every Month'),
              onTap: () => Get.back(result: 30),
            ),
            ListTile(
              title: Text('Every Year'),
              onTap: () => Get.back(result: 365),
            )
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Get.back(), child: Text('Cancal')),
        TextButton(onPressed: () => Get.back(), child: Text('Ok'))
      ],
    );
  }
}
