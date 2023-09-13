
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/NowPlayingResponse.dart';
import '../../models/TopRateMoviesModel.dart';



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




}