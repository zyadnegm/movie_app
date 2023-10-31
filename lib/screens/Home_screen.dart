import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:movies_app/models/watchlist_Model.dart';
import 'package:movies_app/screens/Movie_Details.dart';
import 'package:movies_app/screens/items/NowPlayingMovieListItem.dart';
import 'package:movies_app/screens/items/TopratedMovieListItem.dart';
import 'package:movies_app/screens/items/realese%20item.dart';
import 'package:movies_app/shared/Bloc/Cubit/Home%20Cubit.dart';
import 'package:movies_app/shared/Bloc/states/Home%20States.dart';

class Home_Screen extends StatelessWidget {
  static const String routeName = "home";

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) =>
        Home_Cubite()
          ..getNowPlayingMoive()),
        BlocProvider(
          create: (context) =>
          Toprated_Cubit()
            ..TopRatedMoive(),
        )
      ],
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: BlocBuilder<Home_Cubite, Home_States>(
              builder: (context, state) {
                if (state is HomeLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is HomeMovieSucssesState) {
                  List<Widget> slide = [
                    NowPlayingMovieListItem(
                        Home_Cubite
                            .get(context)
                            .nowPlaying[0]),
                    NowPlayingMovieListItem(
                        Home_Cubite
                            .get(context)
                            .nowPlaying[1]),
                    NowPlayingMovieListItem(
                        Home_Cubite
                            .get(context)
                            .nowPlaying[2]),
                    NowPlayingMovieListItem(
                        Home_Cubite
                            .get(context)
                            .nowPlaying[3]),
                    NowPlayingMovieListItem(
                        Home_Cubite
                            .get(context)
                            .nowPlaying[4])
                  ];

                  return ImageSlideshow(
                    indicatorColor: Colors.white,
                    indicatorBackgroundColor: Colors.grey,
                    indicatorBottomPadding: 50,
                    children: slide,
                    isLoop: true,
                    autoPlayInterval: 1000,
                  );
                } else if (state is HomeMovieFaluierState) {
                  return Center(
                    child: Text("somthing went error"),
                  );
                }
                return Scaffold();
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: BlocBuilder<Home_Cubite, Home_States>(
              builder: (context, state) {
                if (state is HomeLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is HomeMovieSucssesState) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      var movie = Home_Cubite
                          .get(context)
                          .nowPlaying[index];

                      Watchlist_Model watch = Watchlist_Model(
                          tittle: movie
                              .title ??
                              "",
                          image:
                          movie
                              .posterPath ??
                              '');

                      return InkWell(
                        onTap: () {
                          Home_Cubite.get(context).navigate_movie(
                              context,
                              movie.posterPath ?? "",
                              movie.title ?? "",
                              movie.overview ?? "",
                              movie.voteAverage ?? 0);
                        },
                        child: Realease_Item(
                            movie, watch),
                      );
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: Home_Cubite
                        .get(context)
                        .nowPlaying
                        .length,
                  );
                } else if (state is HomeMovieFaluierState) {
                  return Center(
                    child: Text("somthing went error"),
                  );
                }
                return Scaffold();
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: BlocBuilder<Toprated_Cubit, Home_States>(
              builder: (context, state) {
                if (state is HomeLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is HomeTopRatedSucssesState) {
                  return ListView.builder(
                      itemBuilder: (context, index) {
                        var toprated=Toprated_Cubit.get(context).toprated[index];
                        Watchlist_Model topwatch = Watchlist_Model(
                            tittle: toprated
                                .name ??
                                "",
                            image: toprated
                                .posterPath ??
                                "");
                        return InkWell(
                          onTap: () {
                            Home_Cubite.get(context).navigate_movie(
                                context, toprated.posterPath??"", toprated.name??"", toprated.overview??"", toprated.voteAverage??0);
                          },
                          child: TopratedMovieListItem(
                              Toprated_Cubit
                                  .get(context)
                                  .toprated[index],
                              topwatch),
                        );
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: Toprated_Cubit
                          .get(context)
                          .toprated
                          .length);
                } else if (state is HomeTopRatedFaluierState) {
                  return Center(
                    child: Text("somthing went error"),
                  );
                }
                return Scaffold();
              },
            ),
          ),
        ],
      ),
    );
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
