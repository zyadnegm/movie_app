import 'package:flutter/material.dart';
import '../color/colors.dart';



class My_theme {
  static ThemeData appTheme = ThemeData(
      scaffoldBackgroundColor: primarycolor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.black,
        selectedItemColor: yellowcolor,
        unselectedItemColor: Colors.grey,
      ));

}