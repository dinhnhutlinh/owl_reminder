import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:owl_reminder/control/edit_control.dart';
import 'package:owl_reminder/dialog/category_dialog.dart';
import 'package:owl_reminder/style.dart';

// ignore: must_be_immutable
class EditRemindPage extends StatelessWidget {
  EditControl? _editControl;

  EditRemindPage(int id) {
    _editControl = Get.put(EditControl(id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: darkGray),
          actions: [],
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  textInput(),
                  optionRemind(),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                child: Container(
                  width: Get.width,
                  height: Get.height * 0.07,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: darkGray,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ));
  }

  Widget textInput() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, top: 20, right: 20),
          child: TextField(
            controller: _editControl!.titleControl,
            autofocus: false,
            maxLines: 1,
            style: titleStyle,
            decoration: InputDecoration.collapsed(hintText: "Title"),
          ),
        ),
        Divider(),
        Padding(
          padding: EdgeInsets.all(20),
          child: TextField(
            controller: _editControl!.noteControl,
            autofocus: false,
            maxLines: 5,
            style: noteStyle,
            decoration: InputDecoration.collapsed(hintText: "Note"),
          ),
        ),
      ],
    );
  }

  Widget optionRemind() {
    return Column(
      children: [
        Divider(
          thickness: 1,
          height: 1,
        ),
        ListTile(
          leading: LineIcon.tag(),
          title: Text('Category'),
          trailing: Chip(label: Text("kdjdjdj")),
          onTap: () async {
            String? t =await Get.dialog<String>(
              CategoryDiaLog('word'),
            );
            print(t);
          },
        ),
        Divider(
          thickness: 1,
          height: 1,
        ),
        ListTile(
          leading: LineIcon.clock(),
          title: Text('Time'),
          trailing: Chip(label: Text("kdjdjdj")),
          onTap: () {},
        ),
        Divider(
          thickness: 1,
          height: 1,
        ),
        ListTile(
          leading: LineIcon.calendar(),
          title: Text('Date'),
          trailing: Chip(label: Text("kdjdjdj")),
          onTap: () {},
        ),
        Divider(
          thickness: 1,
          height: 1,
        ),
        ListTile(
          leading: LineIcon.hourglass(),
          title: Text('Remind  Before'),
          trailing: Chip(label: Text("kdjdjdj")),
          onTap: () {},
        ),
        Divider(
          thickness: 1,
          height: 1,
        ),
        ListTile(
          leading: LineIcon.syncIcon(),
          title: Text('Repeat'),
          trailing: Chip(label: Text("kdjdjdj")),
          onTap: () {},
        ),
        Divider(
          thickness: 1,
          height: 1,
        ),
        ListTile(
          leading: LineIcon.circle(),
          title: Text('Color'),
          trailing: Chip(label: Text("kdjdjdj")),
          onTap: () {},
        ),
        Divider(
          thickness: 1,
          height: 1,
        ),
      ],
    );
  }
}
