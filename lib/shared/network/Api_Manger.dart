
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/models/nowPlaying_Response.dart';
import 'package:movie_app/shared/component/costants.dart';




class Api_Manager {
  static const playingURL="https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1&api_key=${Constants.Api_Key}";
  static Future<NowPlayingResponse> getPlayingResult() async {
    var response = await http.get(Uri.parse(playingURL));
    var jasonData=jsonDecode(response.body);
    NowPlayingResponse nowPlayingResponse=NowPlayingResponse.fromJson(jasonData);
    return nowPlayingResponse;






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

}
