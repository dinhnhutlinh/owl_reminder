import 'package:flutter/material.dart';
import 'package:owl_reminder/style.dart';

// ignore: must_be_immutable
class FillButton extends StatelessWidget {
  String text;
  bool isFill;
  Color color;
  Radius radius;
  TextStyle textStyle;
  VoidCallback press;

  FillButton(
      {required this.text,
      required this.isFill,
      this.color = darkGray,
      this.radius = const Radius.circular(20),
      this.textStyle = const TextStyle(),
      required this.press});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: press,
      child: Text(text,maxLines: 1,),
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(isFill ? color : Colors.white),
        foregroundColor: MaterialStateProperty.all<Color>(!isFill ? color : Colors.white),
        alignment: Alignment.center,
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(radius),
            side: BorderSide(color: color),
          ),
        ),
      ),
    );
  }
}
