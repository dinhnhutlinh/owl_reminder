import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icon.dart';
import 'package:owl_reminder/control/edit_control.dart';
import 'package:owl_reminder/dialog/category_picker.dart';
import 'package:owl_reminder/dialog/repeat_picker.dart';
import 'package:owl_reminder/style.dart';

// ignore: must_be_immutable
class EditRemindPage extends StatelessWidget {
  EditControl _control = Get.put(EditControl());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        id: 'all',
        init: _control,
        builder: (controller) => Scaffold(
            backgroundColor: _control.color.value,
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
            )));
  }

  Widget textInput() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, top: 20, right: 20),
          child: TextField(
            controller: _control.titleControl,
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
            controller: _control.noteControl,
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
          trailing: Chip(label: Obx(() => Text('${_control.category}'))),
          onTap: () => _control.changCategory(),
        ),
        Divider(
          thickness: 1,
          height: 1,
        ),
        Builder(
          builder: (context) => ListTile(
            leading: LineIcon.clock(),
            title: Text('Time'),
            trailing: Chip(
                label: Text('${_control.time.hour} : ${_control.time.minute}')),
            onTap: () async {
              TimeOfDay? time = await showTimePicker(
                  context: context, initialTime: _control.time);
              if (time != null) _control.setTime(time);
            },
          ),
        ),
        Divider(
          thickness: 1,
          height: 1,
        ),
        Builder(
          builder: (context) => ListTile(
            leading: LineIcon.calendar(),
            title: Text('Date'),
            trailing: Chip(
                label: Text(
                    '${DateFormat('dd/MM/yyyy').format(_control.dateTime)}')),
            onTap: () async {
              DateTime? date = await showDatePicker(
                  context: context,
                  initialDate: _control.dateTime,
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2099));
              if (date != null) _control.setDate(date);
            },
          ),
        ),
        Divider(
          thickness: 1,
          height: 1,
        ),
        ListTile(
          leading: LineIcon.hourglass(),
          title: Text('Remind  Before'),
          trailing: Chip(label: Text('${_control.timeBefore}')),
          onTap: () {},
        ),
        Divider(
          thickness: 1,
          height: 1,
        ),
        ListTile(
          leading: LineIcon.syncIcon(),
          title: Text('Repeat'),
          trailing: Chip(label: Text('${_control.repeat}')),
          onTap: () async {
            int? repeat = await Get.dialog(RepeatDialog(_control.repeat));
          },
        ),
        Divider(
          thickness: 1,
          height: 1,
        ),
        ListTile(
          leading: LineIcon.circle(),
          title: Text('Color'),
          trailing: Chip(label: Text("kdjdjdj")),
          onTap: () {
            _control.changeColor();
          },
        ),
        Divider(
          thickness: 1,
          height: 1,
        ),
      ],
    );
  }
}
