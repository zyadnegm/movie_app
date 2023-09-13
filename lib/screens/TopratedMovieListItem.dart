import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/models/TopRateMoviesModel.dart';
import '../shared/component/costants.dart';



class TopratedMovieListItem extends StatelessWidget {

  Results results;
  TopratedMovieListItem(this.results);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(image: NetworkImage("${Constants.Image_Url}${results.posterPath??''}"),width: 200,height: 150,),
        Text(
          results.name ?? "",
          style:
          GoogleFonts.quicksand(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
        ),
        Text(
          results.firstAirDate ?? "",
          style:
          GoogleFonts.quicksand(fontSize: 15, fontWeight: FontWeight.w400,color: Colors.black),
        ),

      ],
    );
  }
}
