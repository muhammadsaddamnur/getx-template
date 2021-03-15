import 'package:flutter/material.dart';

mixin ConfigTheme {
  ///configuration global theme data
  ///
  static ThemeData themeData = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.lightBlue[800],
    accentColor: Colors.cyan[600],
    fontFamily: 'Georgia',
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),
  );
}
