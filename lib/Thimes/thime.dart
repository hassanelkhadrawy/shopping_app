import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shopping_app/constants/Colors/colors.dart';

ThemeData lightTheme = ThemeData(
    primarySwatch: defaultColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        actionsIconTheme: IconThemeData(
          color: Colors.black,
        ),
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: defaultColor,
      selectedIconTheme: IconThemeData(
        color: defaultColor,
      ),
      elevation: 20.0,
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    ),
    fontFamily: 'janna_font');
ThemeData darkTheme = ThemeData(
    primarySwatch: defaultColor,
    scaffoldBackgroundColor: HexColor("2A373B"),
    appBarTheme: AppBarTheme(
        backgroundColor: HexColor("2A373B"),
        elevation: 0.0,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        actionsIconTheme: IconThemeData(
          color: Colors.white,
        ),
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor("2A373B"),
          statusBarIconBrightness: Brightness.light,
        )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: defaultColor,
      unselectedItemColor: Colors.grey,
      // selectedIconTheme: IconThemeData(
      //   color: Colors.white,
      // ),
      backgroundColor: HexColor("2A373B"),

      elevation: 20.0,
    ),
    textTheme: TextTheme(
        bodyText1: TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    )),
    fontFamily: 'janna_font');
