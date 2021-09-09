import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:owl_reminder/component/fill_button.dart';
import 'package:owl_reminder/model/remind.dart';
import 'package:owl_reminder/style.dart';

// ignore: must_be_immutable
class RemindCard extends StatelessWidget {
  Remind remind;
  RemindCard(this.remind);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        // height: Get.height * 0.15,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
        decoration: BoxDecoration(
          color: remind.color,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${remind.title}',
              style: titleStyle,
            ),
            Row(
              children: [
                FillButton(
                  text: remind.category,
                  isFill: false,
                  press: () {},
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: FillButton(
                    text: DateFormat('kk:mm dd/MM/yy').format(remind.timeTask),
                    isFill: false,
                    press: () {},
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
