import 'package:flutter/material.dart';
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
                  )
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 190, vertical: 90),
                child: Image.asset("assets/images/play-button-2.png")),





          ]),


        ],
      ),
    );
  }
}