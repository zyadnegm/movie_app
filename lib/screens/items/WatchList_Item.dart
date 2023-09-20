import 'package:flutter/material.dart';
import 'package:movies_app/models/watchlist_Model.dart';

import '../../shared/component/costants.dart';

class WatchList_Item extends StatelessWidget {
  Watchlist_Model watchlist_model;

  WatchList_Item(this.watchlist_model);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        child: Row(
          children: [
            Container(
              width: 200,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: Image(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      "${Constants.Image_Url}${watchlist_model.image ?? ''}"),
                ),
              ),
            ),
            SizedBox(width: 15,),
            Text(watchlist_model.tittle??"",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
