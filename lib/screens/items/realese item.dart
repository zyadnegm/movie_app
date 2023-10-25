import 'package:flutter/material.dart';
import 'package:movies_app/models/NowPlayingResponse.dart';
import 'package:movies_app/shared/network/firebase/firebase_function.dart';
import '../../models/watchlist_Model.dart';
import '../../shared/component/costants.dart';

class Realease_Item extends StatelessWidget {
  Results results;
  Watchlist_Model watchlist_model;
  Realease_Item(this.results,this.watchlist_model);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 27,top: 10),
      child: Container(
        height: 130,
        decoration: BoxDecoration(color: Color(0Xff282A28)),
        padding: EdgeInsets.symmetric(vertical: 10),

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child: Stack(
            children:[
              Container(
                width: 140,
                decoration: BoxDecoration(border: Border.all(color: Colors.black,style: BorderStyle.solid)),
                child: Image(fit: BoxFit.fill,
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
        ),
      ),
    );
  }
}
