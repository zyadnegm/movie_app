import 'package:flutter/material.dart';
import 'package:movie_app/Layout/Home_Layout.dart';
import 'package:movie_app/screens/Home_screen.dart';
import 'package:movie_app/shared/style/theme/myTheme.dart';

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


      },
      theme: My_theme.appTheme,


    );
  }
}
