import 'package:flutter/material.dart';
import '../../models/TopRateMoviesModel.dart';
import '../../shared/component/costants.dart';

class TopratedMovieListItem extends StatelessWidget {
  Results results;

  TopratedMovieListItem(this.results);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
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
                    Container(
                      child: Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "${Constants.Image_Url}${results.posterPath ?? ""}"),
                        width: 130,
                        height: 125,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
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
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        "${results.name}",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text("${results.firstAirDate}", style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                          fontSize: 10)),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 12, top: 30),
              child: Image.asset("assets/images/bookmark.png")),
        ],
      ),
    );
  }
}
