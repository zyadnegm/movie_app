import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/Search_Model.dart';
import '../../component/costants.dart';
import '../states/Home States.dart';
import 'package:http/http.dart' as http;


class SearchCubit extends Cubit<Home_States>{
  SearchCubit():super(HomeInitState());
  List<Results>serchdata=[];

  static SearchCubit get(context)=>BlocProvider.of(context);

   Future<void>getSearch(String queryname)async{
     emit(HomeLoadingState());
    Uri url=Uri.https(Constants.Base_Url,"/3/search/movie",{
      "api_key":Constants.Api_Key,
      "query":queryname
    });
     http.get(url).then((response){
       var jsondata=jsonDecode(response.body);
       SearchModel searchModel=SearchModel.fromJson(jsondata);
       serchdata=searchModel.results??[];
       emit(HomeMovieSucssesState());
     }
     ).catchError((e){
       print("error");
       emit(HomeMovieFaluierState(e.toString()));
    });

  }


}
