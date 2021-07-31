import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vendora/utilities/constants.dart';

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
    disabledColor: Colors.purpleAccent,
    buttonColor: Colors.deepOrangeAccent,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        style: BorderStyle.solid,
        width: 1.0,
        color: kThemeColor,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        style: BorderStyle.solid,
        width: 1.0,
        color: kThemeColor,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        style: BorderStyle.solid,
        width: 1.0,
        color: Colors.deepPurple,
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
