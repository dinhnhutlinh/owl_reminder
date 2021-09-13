import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owl_reminder/control/category_control.dart';
import 'package:owl_reminder/style.dart';

import 'fill_button.dart';

class SelectTCategory extends StatelessWidget {
  CategoryControl _categoryControl = Get.put(CategoryControl());
  ValueSetter<String> onChange;
  SelectTCategory({required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          SizedBox(
            height: 45,
            child: Padding(
              padding: EdgeInsets.all(5),
              child: FillButton(
                text: 'All',
                isFill: _categoryControl.selected.value == '',
                press: () {
                  _categoryControl.setCategory('');
                  onChange('');
                },
                textStyle: noteStyle,
              ),
            ),
          ),

          Expanded(
            child: SizedBox(
              height: 45,
              child: Obx(
                () => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _categoryControl.categorys.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.all(5),
                    child: FillButton(
                      text: _categoryControl.categorys[index],
                      isFill: _categoryControl.categorys[index] ==
                          _categoryControl.selected.value,
                      press: () {
                        _categoryControl
                            .setCategory(_categoryControl.categorys[index]);
                        onChange(_categoryControl.categorys[index]);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(Icons.all_inbox),
          // ),
        ],
      ),
    );
  }
}
