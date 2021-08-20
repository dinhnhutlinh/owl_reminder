import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owl_reminder/component/fill_button.dart';
import 'package:owl_reminder/component/remind_card.dart';
import 'package:owl_reminder/control/remind_control.dart';
import 'package:owl_reminder/control/tagcontrol.dart';
import 'package:owl_reminder/model/remind.dart';
import 'package:owl_reminder/style.dart';

class TodayRemind extends StatelessWidget {
  RemindControl control = Get.put(RemindControl());
  CategoryControl controlTag = Get.put(CategoryControl());

  get listRemimd => selectedbyTag(
      controlTag.selectCategory.value, control.getRemindInDay(DateTime.now()));

  List<Remind> selectedbyTag(String tag, List<Remind> reminds) =>
      reminds.where((remind) => remind.category.contains(tag)).toList();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          selectTag(),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 5, 5, 0),
            child: Text('TODAY', style: titleStyle),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: listRemimd.length,
              itemBuilder: (context, index) => RemindCard(
                listRemimd[index],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget selectTag() => Row(
        children: [
          SizedBox(
            height: 45,
            child: Padding(
              padding: EdgeInsets.all(5),
              child: FillButton(
                text: 'All',
                isFill: controlTag.selectCategory.string == '',
                press: () {
                  controlTag.selectCategory.value = "";
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
