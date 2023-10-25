import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/shared/Bloc/states/Home%20States.dart';

import '../../../models/Browser_Model.dart';
import '../../component/costants.dart';


class BrowserCubit extends Cubit<Home_States>{
  BrowserCubit():super(HomeInitState());
  static BrowserCubit get(context)=>BlocProvider.of(context);
  List<Genres>browserdata=[];



  Future<void>Browser_Data()async{
    emit(HomeInitState());
    Uri url=Uri.https(Constants.Base_Url,"/3/genre/movie/list",{
      "api_key":Constants.Api_Key
    });
     http.get(url).then((response) {
       var jsondata=jsonDecode(response.body);
       BrowserModel browserModel=BrowserModel.fromJson(jsondata);
       browserdata=browserModel.genres??[];
       emit(HomeMovieSucssesState());
     }).catchError((e){
      emit(HomeMovieFaluierState(e.toString()));
    });

  }

}