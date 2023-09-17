import 'package:flutter/material.dart';
import '../../models/Search_Model.dart';
import '../../shared/component/costants.dart';

class Search_Item extends StatelessWidget {
  Results results;
  Search_Item(this.results);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
                child: Image(
                  image: NetworkImage(
                      "${Constants.Image_Url}${results.posterPath ?? ''}"),
                ),
              ),
            ),
          ),
          SizedBox(width: 15,),
          Expanded(
            child: Column(
              children: [
                Text(results.title??"",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 14),),
                SizedBox(height:12 ,),
                Text(results.releaseDate??"",style: TextStyle(color: Colors.grey))
              ],
            ),
          )

        ],
      ),
    );
  }
}
