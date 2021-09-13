import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:owl_reminder/control/category_control.dart';
import 'package:owl_reminder/db/catetorytable.dart';
import 'package:owl_reminder/style.dart';

class CategoryDiaLog extends Dialog {
  CategoryControl _control = Get.put(CategoryControl());
  String select;
  CategoryDiaLog(this.select);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: SizedBox(
        width: Get.width * 0.8,
        height: Get.height * 0.4,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _title(),
            Expanded(
              child: ListView.builder(
                itemCount: _control.categorys.length,
                itemBuilder: (context, index) => rowTile(
                    _control.categorys[index],
                    _control.categorys[index] == select),
              ),
            ),
            ElevatedButton(
              onPressed: () => Get.back(),
              child: Text('Cancel'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(yellow),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
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
    child: Text('Select Category'),
  );
}

Widget rowTile(String category, bool isSelect) {
  return GestureDetector(
    onTap: () => Get.back(result: category),
    child: Container(
      decoration:
          BoxDecoration(border: Border(bottom: BorderSide(color: lighGrey))),
      height: 45,
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(category),
            isSelect ? LineIcon.checkCircle() : LineIcon.circle()
          ],
        ),
      ),
    ),
  );
}
    // return AlertDialog(
    //     title: Text('Select Category'),
    //     content: SizedBox(
    //       height: Get.height * 0.2,
    //       child: FutureBuilder<List<String>>(
    //           future: _table.getAllCategory(),
    //           builder: (context, snapshot) {
    //             if (!snapshot.hasData) return CircularProgressIndicator();

    //             List<String>? list = snapshot.data;
    //             return ListView.builder(
    //               itemCount: list!.length + 1,
    //               itemBuilder: (context, index) => Card(
    //                 elevation: 0.1,
    //                 margin: EdgeInsets.zero,
    //                 child: index != list.length
    //                     ? ListTile(
    //                         title: Text(list[index]),
    //                         onTap: () => Get.back(result: list[index]),
    //                       )
    //                     : ListTile(
    //                         leading: LineIcon.plus(),
    //                         title: Text('new categoty'),
    //                         onTap: () {},
    //                       ),
    //               ),
    //             );
    //           }),
    //     ),
    //     actions: [
    //       TextButton(onPressed: () => Get.back(), child: Text('Cancal')),
    //       TextButton(onPressed: () => Get.back(), child: Text('Ok'))
    //     ]);