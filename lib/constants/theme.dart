import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
    indicatorColor: Color(0xff0A2647),
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xff15161a))),
    cardTheme: const CardTheme(color: Color(0xffECF2FF), elevation: 3));

ThemeData darkTheme = ThemeData(
    indicatorColor: Colors.white,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color(0xff0A2647),
    appBarTheme:
        const AppBarTheme(backgroundColor: Color(0xff0A2647), elevation: 0),
    cardTheme: const CardTheme(color: Color(0xff205295), elevation: 3));
