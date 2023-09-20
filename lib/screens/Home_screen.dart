import 'package:flutter/material.dart';
import 'package:movies_app/models/Movie_Model.dart';
import 'package:movies_app/models/watchlist_Model.dart';
import 'package:movies_app/screens/Movie_Details.dart';
import 'package:movies_app/screens/items/NowPlayingMovieListItem.dart';
import 'package:movies_app/screens/items/TopratedMovieListItem.dart';
import 'package:movies_app/screens/items/realese%20item.dart';
import 'package:movies_app/shared/network/firebase/firebase_function.dart';

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
                return Stack(alignment: Alignment.topLeft,
                  children: [
                  InkWell(onTap: () {
                    Navigator.pushNamed(context, Movie_Details.routeName,arguments:
                    Movie_Model(nowPlaying[index].posterPath, nowPlaying[index].title, nowPlaying[index].overview, nowPlaying[index].voteAverage));

                  },
                      child: Realease_Item(nowPlaying[index])),
                  InkWell(onTap: () {
                    Watchlist_Model movie=Watchlist_Model(tittle: nowPlaying[index].title??"", image: nowPlaying[index].posterPath??"");
                    Firebase_Function.add_movie(movie);
                  },
                    child: Container(padding: EdgeInsets.symmetric(vertical: 40,horizontal: 10),
                        child: Image.asset("assets/images/bookmark.png")),
                  ),

                ],);

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
                return Stack(alignment: Alignment.topLeft,
                  children: [
                    InkWell(onTap: () {
                      Navigator.pushNamed(context, Movie_Details.routeName,arguments:
                      Movie_Model(topRated[index].posterPath, topRated[index].name, topRated[index].overview, topRated[index].voteAverage));

                    },
                        child: TopratedMovieListItem(topRated[index])),
                    InkWell(onTap: () {
                      Watchlist_Model top_movie=Watchlist_Model(tittle: topRated[index].name??"", image: topRated[index].posterPath??"",isdond: true);
                      Firebase_Function.add_movie(top_movie);
                    },
                      child: Container(padding: EdgeInsets.symmetric(vertical: 30,horizontal: 13),
                          child: Image.asset("assets/images/bookmark.png")),
                    ),

                  ],);

              },itemCount: topRated.length,scrollDirection: Axis.horizontal,);

            },),
          ),

        ],
      ),

    );
  }
}
