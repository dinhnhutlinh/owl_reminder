import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owl_reminder/component/fill_button.dart';
import 'package:owl_reminder/component/remind_card.dart';
import 'package:owl_reminder/control/todaycontrol.dart';
import 'package:owl_reminder/model/remind.dart';
import 'package:owl_reminder/style.dart';

// ignore: must_be_immutable
class TodayPage extends StatelessWidget {
  TodayControl controlTag = Get.put(TodayControl());

  List<Remind> selectedbyTag(String tag, List<Remind> reminds) =>
      reminds.where((remind) => remind.category.contains(tag)).toList();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() => _selectTag()),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 5, 5, 0),
          child: Text('TODAY', style: titleStyle),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: controlTag.remindInDay.length,
            itemBuilder: (context, index) => RemindCard(
              controlTag.remindInDay[index],
            ),
          ),
        ),
      ],
    );
  }

  Widget _selectTag() => Row(
        children: [
          SizedBox(
            height: 45,
            child: Padding(
              padding: EdgeInsets.all(5),
              child: FillButton(
                text: 'All',
                isFill: controlTag.selectCategory.string == '',
                press: () {
                  controlTag.selectCategory.value = '';
                },
                textStyle: noteStyle,
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 45,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controlTag.categorys.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.all(5),
                  child: FillButton(
                    text: controlTag.categorys[index],
                    isFill: controlTag.selectCategory.string ==
                        controlTag.categorys[index],
                    press: () {
                      controlTag.selectCategory.value =
                          controlTag.categorys[index];
                    },
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.all_inbox),
          ),
        ],
      );
}
