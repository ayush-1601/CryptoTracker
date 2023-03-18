import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Color.fromARGB(255, 219, 241, 254),
  appBarTheme: AppBarTheme(
      backgroundColor: Color.fromARGB(255, 219, 241, 254),
      elevation: 0,
      iconTheme: IconThemeData(color: Color(0xff15161a))),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Color(0xff15161a),
  appBarTheme: AppBarTheme(backgroundColor: Color(0xff15161a), elevation: 0),
);
