
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/shared/component/costants.dart';
import '../../models/Search_Model.dart';



class Api_Manager {

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


}