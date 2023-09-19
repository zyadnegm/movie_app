import 'package:flutter/material.dart';
import 'package:movies_app/screens/Movie_Details.dart';
import 'package:movies_app/screens/searchScreen.dart';
import 'package:movies_app/shared/style/theme/myTheme.dart';

import 'Layout/Home_Layout.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Home_Layout.routeName,
      routes: {
        Home_Layout.routeName:(context) => Home_Layout(),
        Movie_Details.routeName:(context) => Movie_Details()

      },
      theme: My_theme.appTheme,


    );
  }
}