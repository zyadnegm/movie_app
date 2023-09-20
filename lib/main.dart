import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/screens/Movie_Details.dart';
import 'package:movies_app/shared/style/theme/myTheme.dart';

import 'Layout/Home_Layout.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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