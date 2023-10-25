import 'package:flutter/material.dart';
import 'package:movies_app/shared/network/firebase/firebase_function.dart';
import '../../models/TopRateMoviesModel.dart';
import '../../models/watchlist_Model.dart';
import '../../shared/component/costants.dart';

class TopratedMovieListItem extends StatelessWidget {
  Result results;
  Watchlist_Model watchlist_model;
  TopratedMovieListItem(this.results,this.watchlist_model);
  @override
  Widget build(BuildContext context) {
    int count=1;

    return Container(
      height: 300,
      decoration: BoxDecoration(color: Color(0Xff282A28)),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 10),
            child: Card(
              elevation: 40,
              color: Color(0Xff514F4F),
              child: Container(
                padding: EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.topLeft,
                      children:[
                        Container(
                          width: 130,
                          height: 120,
                          child: Image(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "${Constants.Image_Url}${results.posterPath ?? ""}"),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Firebase_Function.add_movie(watchlist_model);
                          },
                            child: Image.asset("assets/images/bookmark.png")),
                      ]
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.orangeAccent,
                            ),
                            Text("${results.voteAverage}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontSize: 13))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 3,),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          width: 120,
                          height: 30,
                          child: Text(
                            "${results.name}",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 3,),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text("${results.firstAirDate}", style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 10)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
