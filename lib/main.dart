import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/screens/Home_screen.dart';
import 'package:movies_app/screens/Movie_Details.dart';
import 'package:movies_app/screens/login/login_screen.dart';
import 'package:movies_app/screens/searchScreen.dart';
import 'package:movies_app/shared/Bloc/Cubit/Home%20Cubit.dart';
import 'package:movies_app/shared/Bloc/Cubit/SearchCubit.dart';
import 'package:movies_app/shared/style/theme/myTheme.dart';
import 'package:provider/provider.dart';

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
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Login_Screen.routeName,
        routes: {
          Home_Layout.routeName:(context) => Home_Layout(),
          Movie_Details.routeName:(context) => Movie_Details(),
          Login_Screen.routeName:(context) => Login_Screen(),
          Home_Screen.routeName:(context) => Home_Screen(),
          Search_Screen.routeName:(context) => Search_Screen()

        },
        theme: My_theme.appTheme,


      ),
    );
  }
}