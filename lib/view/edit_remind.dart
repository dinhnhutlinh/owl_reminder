import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:owl_reminder/control/edit_control.dart';
import 'package:owl_reminder/model/remind.dart';
import 'package:owl_reminder/style.dart';

// ignore: must_be_immutable
class EditRemind extends StatelessWidget {
  EditControl _editControl;

  EditRemind(int id) {
    _editControl = Get.put(EditControl(id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.yellow,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: darkGray),
        actions: [],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, top: 20, right: 20),
            child: TextField(
              controller: _editControl.titleControl,
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
              controller: _editControl.noteControl,
              autofocus: false,
              maxLines: 5,
              style: noteStyle,
              decoration: InputDecoration.collapsed(hintText: "Note"),
            ),
          ),
          selectCategory(),
          selectTime(),
          selectDate(),
          selectTimeBefore(),
          selectRepeat(),
          selectLocation(),
          Expanded(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              child: Container(
                height: Get.height * 0.07,
                decoration: BoxDecoration(
                    color: yellow,
                    boxShadow: [BoxShadow(color: gray)],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                alignment: Alignment.center,
                child: Text('Save'),
              ),
            ),
          ))
        ],
      ),
    );
  }

  Widget selectCategory() {
    return Container(
      decoration: BoxDecoration(
          border: Border(
        top: BorderSide(color: gray),
      )),
      height: Get.height * 0.08,
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          children: [
            Icon(Icons.access_alarm),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("Category", style: noteStyle),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Work",
                  style: noteStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget selectTime() {
    return Container(
      decoration: BoxDecoration(
          border: Border(
        top: BorderSide(color: gray),
      )),
      height: Get.height * 0.08,
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          children: [
            Icon(Icons.access_alarm),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("Time Task", style: noteStyle),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '${_editControl.time.hour}:${_editControl.time.minute}',
                  style: noteStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget selectDate() {
    return Container(
      decoration: BoxDecoration(
          border: Border(
        top: BorderSide(color: gray),
      )),
      height: Get.height * 0.08,
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          children: [
            Icon(Icons.access_alarm),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("Date", style: noteStyle),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  DateFormat('dd/MM/yyyy').format(_editControl.dateTime),
                  style: noteStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget selectTimeBefore() {
    return Container(
      decoration: BoxDecoration(
          border: Border(
        top: BorderSide(color: gray),
      )),
      height: Get.height * 0.08,
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          children: [
            Icon(Icons.access_alarm),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("Notifi before", style: noteStyle),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '${_editControl.timeBefore}',
                  style: noteStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget selectRepeat() {
    return Container(
      decoration: BoxDecoration(
          border: Border(
        top: BorderSide(color: gray),
      )),
      height: Get.height * 0.08,
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          children: [
            Icon(Icons.access_alarm),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("Repeat", style: noteStyle),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  _editControl.repeat == 0 ? 'No repeat' : '',
                  style: noteStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget selectLocation() {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(color: gray), bottom: BorderSide(color: gray))),
      height: Get.height * 0.08,
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          children: [
            Icon(Icons.access_alarm),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("Location", style: noteStyle),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  _editControl.location == "" ? 'No repeat' : '',
                  style: noteStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
