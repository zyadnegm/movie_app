import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/nowPlaying_Response.dart';


class Home_Item extends StatelessWidget {

  Results results;
  Home_Item(this.results);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Text(
          results.originalTitle ?? "",
          style:
              GoogleFonts.quicksand(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
        ),
        Text(
          results.releaseDate ?? "",
          style:
          GoogleFonts.quicksand(fontSize: 15, fontWeight: FontWeight.w400,color: Colors.black),
        ),

      ],
    );
  }
}
