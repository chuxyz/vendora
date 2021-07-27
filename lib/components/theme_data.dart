import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primarySwatch: Colors.grey,
  primaryColor: Colors.white,
  accentColor: Colors.black,
  focusColor: Colors.white70,
  backgroundColor: Colors.grey,
  buttonTheme: ButtonThemeData(
    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
    buttonColor: Colors.deepOrangeAccent,
  ),
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        style: BorderStyle.solid,
        width: 1.0,
        color: Colors.grey,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        style: BorderStyle.solid,
        width: 1.0,
        color: Colors.grey,
      ),
    ),
  ),
);
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primarySwatch: Colors.grey,
  primaryColor: Colors.black,
  accentColor: Colors.white,
  focusColor: Colors.black54,
  backgroundColor: Colors.grey,
  buttonTheme: ButtonThemeData(
    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
    buttonColor: Colors.deepOrangeAccent,
  ),
);
