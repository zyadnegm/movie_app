import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/models/watchlist_Model.dart';
import 'package:movies_app/screens/items/NowPlayingMovieListItem.dart';
import 'package:movies_app/screens/items/TopratedMovieListItem.dart';
import 'package:movies_app/screens/items/realese%20item.dart';
import 'package:movies_app/shared/Bloc/Cubit/Home%20Cubit.dart';
import 'package:movies_app/shared/Bloc/states/Home%20States.dart';


class Home_Screen extends StatelessWidget {
  static const String routeName = "home";

  // Watchlist_Model ?watch;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
          create: (context) =>
      Home_Cubite()
        ..getNowPlayingMoive()),
      BlocProvider(create: (context) => Toprated_Cubit()..TopRatedMoive(),)

    ],

      child: Column(
        children: [
          Expanded(flex: 1,
            child: BlocBuilder<Home_Cubite, Home_States>(
              builder: (context, state) {
                if (state is HomeLoadingState) {
                  return Center(child: CircularProgressIndicator(),);
                }
                else if (state is HomeMovieSucssesState) {
                  return ListView.builder(itemBuilder: (context, index) {
                    return NowPlayingMovieListItem(Home_Cubite
                        .get(context)
                        .nowPlaying[index]);
                  }, scrollDirection: Axis.horizontal,);
                }
                else if (state is HomeMovieFaluierState) {
                  return Center(child: Text("somthing went error"),);
                }
                return Scaffold();
              },
            ),
          ),
          Expanded(flex: 1,
            child: BlocBuilder<Home_Cubite, Home_States>(
              builder: (context, state) {
                if (state is HomeLoadingState) {
                  return Center(child: CircularProgressIndicator(),);
                }
                else if (state is HomeMovieSucssesState) {
                  return ListView.builder(itemBuilder: (context, index) {
                    Watchlist_Model watch = Watchlist_Model(tittle: Home_Cubite
                        .get(context)
                        .nowPlaying[index].title ?? "", image: Home_Cubite
                        .get(context)
                        .nowPlaying[index].posterPath ?? '');

                    return Realease_Item(Home_Cubite
                        .get(context)
                        .nowPlaying[index],watch);
                  }, scrollDirection: Axis.horizontal,
                    itemCount: Home_Cubite
                        .get(context)
                        .nowPlaying
                        .length,);
                }
                else if (state is HomeMovieFaluierState) {
                  return Center(child: Text("somthing went error"),);
                }
                return Scaffold();
              },
            ),
          ),
          Expanded(flex: 1,
            child: BlocBuilder<Toprated_Cubit, Home_States>(
              builder: (context, state) {
                if (state is HomeLoadingState) {
                  return Center(child: CircularProgressIndicator(),);
                }
                else if (state is HomeTopRatedSucssesState) {
                  return ListView.builder(itemBuilder: (context, index) {
                    Watchlist_Model topwatch=Watchlist_Model(tittle: Toprated_Cubit.get(context).toprated[index].name??"",
                        image: Toprated_Cubit.get(context).toprated[index].posterPath??"");
                    return TopratedMovieListItem(Toprated_Cubit
                        .get(context)
                        .toprated[index],topwatch);
                  }, scrollDirection: Axis.horizontal,
                      itemCount: Toprated_Cubit
                          .get(context)
                          .toprated
                          .length);
                }
                else if (state is HomeTopRatedFaluierState) {
                  return Center(child: Text("somthing went error"),);
                }
                return Scaffold();
              },
            ),
          ),
        ],
      ),);
  }
}


//Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             child: FutureBuilder(future: Api_Manager.NowPlayingMoive(), builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(child: CircularProgressIndicator());
//               }
//               if (snapshot.hasError) {
//                 return Center(
//                   child: Text("somthing has error"),
//                 );
//               }
//               var nowPlaying = snapshot.data?.results ?? [];
//               return ListView.builder(itemBuilder: (context, index) {
//                 return NowPlayingMovieListItem(nowPlaying[index]);
//
//               },itemCount: nowPlaying.length,scrollDirection: Axis.horizontal,);
//
//             },),
//           ),
//           Expanded(
//             child: FutureBuilder(future: Api_Manager.NowPlayingMoive(), builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(child: CircularProgressIndicator());
//               }
//               if (snapshot.hasError) {
//                 return Center(
//                   child: Text("somthing has error"),
//                 );
//               }
//               var nowPlaying = snapshot.data?.results ?? [];
//               return ListView.builder(itemBuilder: (context, index) {
//                 return Stack(alignment: Alignment.topLeft,
//                   children: [
//                   InkWell(onTap: () {
//                     Navigator.pushNamed(context, Movie_Details.routeName,arguments:
//                     Movie_Model(nowPlaying[index].posterPath, nowPlaying[index].title, nowPlaying[index].overview, nowPlaying[index].voteAverage));
//
//                   },
//                       child: Realease_Item(nowPlaying[index])),
//                   InkWell(onTap: () {
//                     Watchlist_Model movie=Watchlist_Model(tittle: nowPlaying[index].title??"", image: nowPlaying[index].posterPath??"");
//                     Firebase_Function.add_movie(movie);
//                   },
//                     child: Container(padding: EdgeInsets.symmetric(vertical: 40,horizontal: 10),
//                         child: Image.asset("assets/images/bookmark.png")),
//                   ),
//
//                 ],);
//
//               },itemCount: nowPlaying.length,scrollDirection: Axis.horizontal,);
//
//             },),
//           ),
//           Expanded(
//             child: FutureBuilder(future: Api_Manager.TopRatedMoive(), builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(child: CircularProgressIndicator());
//               }
//               if (snapshot.hasError) {
//                 return Center(
//                   child: Text("somthing has error"),
//                 );
//               }
//               var topRated = snapshot.data?.results ?? [];
//               return ListView.builder(itemBuilder: (context, index) {
//                 return Stack(alignment: Alignment.topLeft,
//                   children: [
//                     InkWell(onTap: () {
//                       Navigator.pushNamed(context, Movie_Details.routeName,arguments:
//                       Movie_Model(topRated[index].posterPath, topRated[index].name, topRated[index].overview, topRated[index].voteAverage));
//
//                     },
//                         child: TopratedMovieListItem(topRated[index])),
//                     InkWell(onTap: () {
//                       Watchlist_Model top_movie=Watchlist_Model(tittle: topRated[index].name??"", image: topRated[index].posterPath??"",isdond: true);
//                       Firebase_Function.add_movie(top_movie);
//                     },
//                       child: Container(padding: EdgeInsets.symmetric(vertical: 30,horizontal: 13),
//                           child: Image.asset("assets/images/bookmark.png")),
//                     ),
//
//                   ],);
//
//               },itemCount: topRated.length,scrollDirection: Axis.horizontal,);
//
//             },),
//           ),
//
//         ],
//       ),
//
//     )
