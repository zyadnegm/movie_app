import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/NowPlayingResponse.dart';
import '../../shared/component/costants.dart';

class NowPlayingMovieListItem extends StatelessWidget {
  Results results;

  NowPlayingMovieListItem(this.results);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(alignment: Alignment.bottomLeft, children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 33),
              child: Container(
                  width: 400,
                  height: 170,
                  child: Image(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "${Constants.Image_Url}${results.posterPath ?? ''}"),
                  )),
            ),
            Stack(
              alignment: Alignment.topLeft,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.black,style: BorderStyle.solid)),
                    child: Image(fit: BoxFit.fill,
                      image: NetworkImage(
                          "${Constants.Image_Url}${results.posterPath ?? ""}"),
                      width: 100,
                      height: 130,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(alignment: Alignment.center,
                      child: Image.asset("assets/images/bookmark.png")),
                ),
              ],
            )

          ]),
          // Container(color: Colors.yellow,
          //   child: Column(
          //     children: [
          //     Text(
          //       results.originalTitle ?? "",
          //       style: GoogleFonts.quicksand(
          //           fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          //     ),
          //     Text(
          //       results.releaseDate ?? "",
          //       style: GoogleFonts.quicksand(
          //           fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white),
          //     ),
          //
          //   ],),
          // )


        ],
      ),
    );
  }
}
