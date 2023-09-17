import 'package:flutter/material.dart';
import '../../models/Browser_Model.dart';
import '../../shared/component/costants.dart';

class Browser_Item extends StatelessWidget {
  Genres genres;
  List<Image>browserImages;

  Browser_Item(this.genres, this.browserImages);

  @override
  Widget build(BuildContext context) {

    return item();
  }
   item(){
    for(int i=0;i<browserImages.length;i++){
      return Stack(
        children: [
          browserImages[i],
          Text(genres.name??"")
        ],
      );

    };
  }
}

