import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/screens/NowPlayingMovieListItem.dart';
import 'package:movies_app/screens/TopratedMovieListItem.dart';
import 'package:movies_app/shared/component/costants.dart';
import 'package:movies_app/shared/network/Api_Manger.dart';


class Home_Screen extends StatelessWidget {
  static const String routeName="home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          FutureBuilder(future: Api_Manager.NowPlayingMoive(), builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(
                child: Text("somthing has error"),
              );
            }
            var poplurMovies = snapshot.data?.results ?? [];
            return Expanded(
              child: ListView.builder(scrollDirection: Axis.horizontal,itemBuilder: (context, index) {
                return NowPlayingMovieListItem(poplurMovies[index]);

              },itemCount: poplurMovies.length,),
            );

          },),
          FutureBuilder(future: Api_Manager.NowPlayingMoive(), builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(
                child: Text("somthing has error"),
              );
            }
            var nowPlaying = snapshot.data?.results ?? [];
            return Expanded(
              child: ListView.builder(scrollDirection: Axis.horizontal,itemBuilder: (context, index) {
                return NowPlayingMovieListItem(nowPlaying[index]);

              },itemCount: nowPlaying.length,),
            );

          },),
          FutureBuilder(future: Api_Manager.TopRatedMoive(), builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(
                child: Text("somthing has error"),
              );
            }
            var TopratedMovies = snapshot.data?.results ?? [];
            return Expanded(
              child: ListView.builder(scrollDirection: Axis.horizontal,itemBuilder: (context, index) {
                return TopratedMovieListItem(TopratedMovies[index]);

              },itemCount: TopratedMovies.length,),
            );

          },),
        ],
      ),

    );
  }
}
