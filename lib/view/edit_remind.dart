import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:owl_reminder/model/remind.dart';
import 'package:owl_reminder/style.dart';

class EditRemind extends StatelessWidget {
  Remind remind;
  EditRemind(this.remind);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: darkGray),
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            TextField(
              autofocus: false,
              expands: false,
              decoration: InputDecoration(),
            ),
          ],
        ),
      ),
    );
  }
}
