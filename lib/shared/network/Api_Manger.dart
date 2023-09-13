
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/models/NowPlayingResponse.dart';
import 'package:movies_app/models/TopRateMoviesModel.dart';


class Api_Manager {
  static Future<Movies>NowPlayingMoive()async{
    Uri url=Uri.https("api.themoviedb.org","/3/trending/movie/day",{
      "api_key":"bdd425716299381ec36270386e980901"
    });
    var response=await http.get(url);
    var jsondata=jsonDecode(response.body);
    Movies nowPlayingResponse=Movies.fromJson(jsondata);
    return nowPlayingResponse;
  }
  static Future<TopRateMoviesModel>TopRatedMoive()async{
    Uri url=Uri.https("api.themoviedb.org","/3/tv/top_rated",{
      "api_key":"bdd425716299381ec36270386e980901"
    });
    var response=await http.get(url);
    var jsondata=jsonDecode(response.body);
    TopRateMoviesModel topRateMoviesModel=TopRateMoviesModel.fromJson(jsondata);
    return topRateMoviesModel;
  }






    // static Future<PopularResult> getٌRealeses() async {
    //   Uri url=Uri.https("themoviedb.org","/3/movie/popular",{
    //     "apiKey":"bdd425716299381ec36270386e980901"
    //   }
    //   );
    //   var response =await http.get(url);
    //   print(response.body);
    //   var jasonData=jsonDecode(response.body);
    //   PopularResult popularResult=PopularResult.fromJson(jasonData);
    //   return popularResult;
    //
    // }


  }
