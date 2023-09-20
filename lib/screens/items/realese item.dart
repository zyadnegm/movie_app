import 'package:flutter/material.dart';
import 'package:movies_app/models/NowPlayingResponse.dart';

import '../../shared/component/costants.dart';

class Realease_Item extends StatelessWidget {
  Results results;
  Realease_Item(this.results);

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(color: Color(0Xff282A28)),
      padding: EdgeInsets.symmetric(vertical: 10),
      margin: EdgeInsets.symmetric(vertical: 30,),

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(

          decoration: BoxDecoration(border: Border.all(color: Colors.black,style: BorderStyle.solid)),
          child: Image(fit: BoxFit.fill,
            image: NetworkImage(
                "${Constants.Image_Url}${results.posterPath ?? ""}"),
            width: 150,
            height: 200,
          ),
        ),
      ),
    );
  }
}
