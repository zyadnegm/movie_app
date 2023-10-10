import 'package:flutter/material.dart';
import '../../models/Search_Model.dart';
import '../../shared/component/costants.dart';

class Search_Item extends StatelessWidget {
  Results results;
  Search_Item(this.results);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 400,
      // height: 250,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 38,vertical: 25),
            child: Container(
              width: 200,
              height: 140,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      "${Constants.Image_Url}${results.posterPath ?? ''}"),
                ),
              ),
            ),
          ),

          Container(
            width: 115,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(results.title??"",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 14),),
                SizedBox(height: 7,),

                Text(results.releaseDate??"",style: TextStyle(color: Colors.grey))
              ],
            ),
          )

        ],
      ),
    );
  }
}
