import 'package:flutter/material.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
    primaryTextTheme: TextTheme(),
    primaryColor: Colors.blueGrey[300],
    appBarTheme: AppBarTheme(
      elevation: 2.0,
      iconTheme: IconThemeData(
        color: Colors.black, //change your color here
  ),
      color: Colors.white,
      textTheme: TextTheme(
        headline6: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold)
      ),
    ),
  );

  final darkTheme =
      ThemeData.dark().copyWith(primaryColor: Color(0xFF636363),
      scaffoldBackgroundColor: Color(0xFF636363),
        appBarTheme: AppBarTheme(
          elevation: 2.0,
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          textTheme: TextTheme(
            headline6: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
        ),
      );
}
