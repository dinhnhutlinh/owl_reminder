import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color blue = Color.fromARGB(255, 0, 123, 255);
const Color tear = Color.fromARGB(255, 23, 162, 184);
const Color green = Color.fromARGB(255, 40, 167, 69);
const Color yellow = Color.fromARGB(255, 255, 193, 7);
const Color red = Color.fromARGB(255, 220, 53, 69);
const Color darkGray = Color.fromARGB(255, 52, 58, 64);
const Color gray = Color.fromARGB(255, 108, 117, 125);
const Color light = Color.fromARGB(255, 248, 249, 250);
const Color white = Color.fromARGB(255, 255, 255, 255);
final Color lighGrey = Colors.grey.withOpacity(0.5);

AppBarTheme _appBarTheme = AppBarTheme(
  centerTitle: true,
  elevation: 0,
  color: yellow,
);
int currentId = 0;
TextStyle titleStyle = GoogleFonts.notoSans(
    color: darkGray, fontSize: 24, fontWeight: FontWeight.bold);

TextStyle noteStyle = GoogleFonts.notoSans(
    color: darkGray, fontSize: 14, fontWeight: FontWeight.bold);
FloatingActionButtonThemeData _floatThemeData = FloatingActionButtonThemeData(
    backgroundColor: yellow, foregroundColor: darkGray);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: _appBarTheme,
  backgroundColor: white,
  accentColorBrightness: Brightness.light,
  floatingActionButtonTheme: _floatThemeData,
);
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: _appBarTheme,
  backgroundColor: white,
  accentColorBrightness: Brightness.light,
  floatingActionButtonTheme: _floatThemeData,
);
