import 'package:flutter/material.dart';
import 'package:movie_app/models/nowPlaying_Response.dart';
import 'package:movie_app/screens/Home_Item.dart';
import 'package:movie_app/shared/network/Api_Manger.dart';

class Home_Screen extends StatelessWidget {
  static const String routeName="home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(future: Api_Manager.getPlayingResult(), builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(
            child: Text("somthing has error"),
          );
        }
        var nowPlaying = snapshot.data?.results ?? [];
        return ListView.builder(itemBuilder: (context, index) {
          return Text(nowPlaying[index].title??"");

        },itemCount: nowPlaying.length,);

      },),

    );
  }
}
