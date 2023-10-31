import 'package:flutter/material.dart';

import '../models/Movie_Model.dart';
import '../shared/component/costants.dart';

class Movie_Details extends StatelessWidget {
  static const String routeName = "mo";

  @override
  Widget build(BuildContext context) {
    final argument_data =
        ModalRoute.of(context)!.settings.arguments as Movie_Model;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0Xff1D1E1D),
        title: Text(
          argument_data.tittle ?? "",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                child: Image(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "${Constants.Image_Url}${argument_data.image ?? ''}")),
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 180, vertical: 75),
                  child: Image.asset("assets/images/play-button-2.png"))
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            child: Text(argument_data.tittle ?? "",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
          ),
          Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Container(
                      width: 140,
                      height: 200,
                      child: Image(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              "${Constants.Image_Url}${argument_data.image ?? ''}")),
                    ),
                    Image.asset("assets/images/bookmark.png")
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                   width: 200,
                    child: Text(
                      argument_data.overview?? "",maxLines: 5,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ),
                  Divider(color: Colors.white,endIndent: 6,indent: 6,thickness: 5,),
                  Row(
                    children: [
                      Icon(Icons.star,color: Colors.orangeAccent,),
                      SizedBox(width: 5,),
                      Text("${argument_data.voteAverage??""}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),)
                    ],
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 70,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(alignment: Alignment.center,
                width: 170,
                height: 40,
                decoration: BoxDecoration(color: Colors.indigo
                    ,borderRadius: BorderRadius.circular(17)),
              child: Text("Play",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),),
              SizedBox(width: 10,),
              Container(alignment: Alignment.center,
                width: 170,
                height: 40,
                decoration: BoxDecoration(color: Colors.orange,borderRadius: BorderRadius.circular(17)),
                child: Text("Download",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),),
            ],
          )
        ],
      ),
    );
  }
}
