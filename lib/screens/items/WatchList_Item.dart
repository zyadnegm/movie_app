import 'package:flutter/material.dart';
import 'package:movies_app/models/watchlist_Model.dart';
import 'package:movies_app/shared/network/firebase/firebase_function.dart';

import '../../shared/component/costants.dart';

class WatchList_Item extends StatefulWidget {
  Watchlist_Model watchlist_model;

  WatchList_Item(this.watchlist_model);

  @override
  State<WatchList_Item> createState() => _WatchList_ItemState();
}

class _WatchList_ItemState extends State<WatchList_Item> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        child: Row(
          children: [
            Stack(children: [
              Container(
                width: 200,
                height: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: Image(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "${Constants.Image_Url}${widget.watchlist_model.image ?? ''}"),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                   Firebase_Function.deleteData(widget.watchlist_model.id);

                },
                child: Container(
                  child: Image.asset("assets/images/yello bookmark.png"),
                ),
              )
            ],),

            SizedBox(width: 15,),
            Text(widget.watchlist_model.tittle??"",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
