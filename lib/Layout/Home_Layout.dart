import 'package:flutter/material.dart';
import '../screens/BrowserScreen.dart';
import '../screens/Home_screen.dart';
import '../screens/searchScreen.dart';
import '../screens/watchlist.dart';
import '../shared/component/costants.dart';
import '../shared/style/color/colors.dart';

class Home_Layout extends StatefulWidget {
  static const String routeName="lay";

  @override
  State<Home_Layout> createState() => _Home_LayoutState();
}

class _Home_LayoutState extends State<Home_Layout> {
  int currentIndex=0;

  List<Widget>taps=[Home_Screen(),Search_Screen(),BrowserScreen(),Watch_List()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex=value;
          setState(() {
          });
        },
        items:<BottomNavigationBarItem> [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home",backgroundColor: primarycolor),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: "search",backgroundColor: primarycolor),
          BottomNavigationBarItem(icon: Icon(Icons.movie),label: "Browser",backgroundColor: primarycolor),
          BottomNavigationBarItem(icon: Icon(Icons.book),label: "Watclist",backgroundColor: primarycolor),
        ],
      ),
      body: taps[currentIndex],

    );
  }
}

