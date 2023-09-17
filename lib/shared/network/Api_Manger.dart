
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/shared/component/costants.dart';

import '../../models/Browser_Model.dart';
import '../../models/NowPlayingResponse.dart';
import '../../models/Search_Model.dart';
import '../../models/TopRateMoviesModel.dart';



class Api_Manager {
  static Future<Movies>NowPlayingMoive()async{
    Uri url=Uri.https(Constants.Base_Url,"/3/trending/movie/day",{
      "api_key":Constants.Api_Key
    });
    var response=await http.get(url);
    var jsondata=jsonDecode(response.body);
    Movies nowPlayingResponse=Movies.fromJson(jsondata);
    return nowPlayingResponse;
  }
  static Future<TopRateMoviesModel>TopRatedMoive()async{
    Uri url=Uri.https(Constants.Base_Url,"/3/tv/top_rated",{
      "api_key":Constants.Api_Key
    });
    var response=await http.get(url);
    var jsondata=jsonDecode(response.body);
    TopRateMoviesModel topRateMoviesModel=TopRateMoviesModel.fromJson(jsondata);
    return topRateMoviesModel;
  }

  static Future<SearchModel>getSearch(String queryname)async{
    Uri url=Uri.https(Constants.Base_Url,"/3/search/movie",{
      "api_key":Constants.Api_Key,
      "query":queryname
    });
    var response=await http.get(url);
    var jsondata=jsonDecode(response.body);
    SearchModel searchModel=SearchModel.fromJson(jsondata);
    return searchModel;

  }

  static Future<BrowserModel>Browser_Data()async{
    Uri url=Uri.https(Constants.Base_Url,"/3/genre/movie/list",{
      "api_key":Constants.Api_Key
    });
    var response=await http.get(url);
    var jsondata=jsonDecode(response.body);
    BrowserModel browserModel=BrowserModel.fromJson(jsondata);
    return browserModel;
  }




}