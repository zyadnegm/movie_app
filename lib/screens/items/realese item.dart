import 'package:flutter/material.dart';
import 'package:movies_app/models/NowPlayingResponse.dart';

import '../../shared/component/costants.dart';

class Realease_Item extends StatelessWidget {
  Results results;
  Realease_Item(this.results);

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.only(top: 70,bottom: 35),

      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.black,style: BorderStyle.solid)),
              child: Image(fit: BoxFit.fill,
                image: NetworkImage(
                    "${Constants.Image_Url}${results.posterPath ?? ""}"),
                width: 140,
                height: 120,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(alignment: Alignment.center,
                child: Image.asset("assets/images/bookmark.png")),
          ),
        ],
      ),
    );
  }
}
