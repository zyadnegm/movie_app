import 'package:flutter/material.dart';
import 'package:movies_app/models/TopRateMoviesModel.dart';
import 'package:movies_app/screens/NowPlayingMovieListItem.dart';
import 'package:movies_app/screens/TopratedMovieListItem.dart';

import '../shared/network/Api_Manger.dart';
class Home_Screen extends StatelessWidget {
  static const String routeName="home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: FutureBuilder(future: Api_Manager.NowPlayingMoive(), builder: (context, snapshot) {
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
          return NowPlayingMovieListItem(nowPlaying[index]);

        },itemCount: nowPlaying.length,);

      },),

    );
  }
}
