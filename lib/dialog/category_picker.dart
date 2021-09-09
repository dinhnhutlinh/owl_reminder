import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:owl_reminder/db/catetorytable.dart';

class CategoryDiaLog extends Dialog {
  CategoryTable _table = CategoryTable();
  String select;
  CategoryDiaLog(this.select);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text('Select Category'),
        content: SizedBox(
          height: Get.height * 0.2,
          child: FutureBuilder<List<String>>(
              future: _table.getAllCategory(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();

                List<String>? list = snapshot.data;
                return ListView.builder(
                  itemCount: list!.length + 1,
                  itemBuilder: (context, index) => Card(
                    elevation: 0.1,
                    margin: EdgeInsets.zero,
                    child: index != list.length
                        ? ListTile(
                            title: Text(list[index]),
                            onTap: () => Get.back(result: list[index]),
                          )
                        : ListTile(
                            leading: LineIcon.plus(),
                            title: Text('new categoty'),
                            onTap: () {},
                          ),
                  ),
                );
              }),
        ),
        actions: [
          TextButton(onPressed: () => Get.back(), child: Text('Cancal')),
          TextButton(onPressed: () => Get.back(), child: Text('Ok'))
        ]);
  }
}
//  height: Get.height * 0.5,
//       width: Get.width,
      // color: Colors.white,
      // child: FutureBuilder<List<String>>(
      //     future: _table.getAllCategory(),
      //     builder: (context, snapshot) {
      //       if (!snapshot.hasData) return CircularProgressIndicator();

      //       List<String>? list = snapshot.data;
      //       return ListView.builder(
      //         itemCount: list!.length,
      //         itemBuilder: (context, index) => Text(list[index]),
      //       );
      //     }),