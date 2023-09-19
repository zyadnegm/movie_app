import 'package:flutter/material.dart';
import 'package:movies_app/models/Movie_Model.dart';
import 'package:movies_app/screens/Movie_Details.dart';
import 'package:movies_app/screens/items/NowPlayingMovieListItem.dart';
import 'package:movies_app/screens/items/TopratedMovieListItem.dart';
import 'package:movies_app/screens/items/realese%20item.dart';

import '../shared/network/Api_Manger.dart';
class Home_Screen extends StatelessWidget {
  static const String routeName="home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      

      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(future: Api_Manager.NowPlayingMoive(), builder: (context, snapshot) {
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

              },itemCount: nowPlaying.length,scrollDirection: Axis.horizontal,);

            },),
          ),
          Expanded(
            child: FutureBuilder(future: Api_Manager.NowPlayingMoive(), builder: (context, snapshot) {
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
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Movie_Details.routeName,arguments:Movie_Model(
                        nowPlaying[index].posterPath, nowPlaying[index].title, nowPlaying[index].overview, nowPlaying[index].voteAverage) );
                  },
                    child: Realease_Item(nowPlaying[index]));

              },itemCount: nowPlaying.length,scrollDirection: Axis.horizontal,);

            },),
          ),
          Expanded(
            child: FutureBuilder(future: Api_Manager.TopRatedMoive(), builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text("somthing has error"),
                );
              }
              var topRated = snapshot.data?.results ?? [];
              return ListView.builder(itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Movie_Details.routeName,arguments:Movie_Model(
                        topRated[index].posterPath, topRated[index].name, topRated[index].overview, topRated[index].voteAverage) );
                  },
                    child: TopratedMovieListItem(topRated[index]));

              },itemCount: topRated.length,scrollDirection: Axis.horizontal,);

            },),
          ),

        ],
      ),

    );
  }
}
