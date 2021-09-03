import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:owl_reminder/component/circal_button.dart';
import 'package:owl_reminder/control/edit_control.dart';
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
      // backgroundColor: Colors.yellow,
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
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: selectOption(),
          )
        ],
      ),
    );
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

  Widget selectOption() {
    return Padding(
      padding: EdgeInsets.only(right: Get.width * 0.07, left: Get.width * 0.07),
      child: Wrap(
        children: [
          CircleButton(Icon(Icons.add), () {}, true),
          CircleButton(Icon(Icons.add), () {}, true),
          CircleButton(Icon(Icons.add), () {}, true),
          CircleButton(Icon(Icons.add), () {}, true),CircleButton(Icon(Icons.add), () {}, true),
          CircleButton(Icon(Icons.add), () {}, true),
          CircleButton(Icon(Icons.add), () {}, true),
          CircleButton(Icon(Icons.add), () {}, true),
        ],
      ),
    );
  }
}
