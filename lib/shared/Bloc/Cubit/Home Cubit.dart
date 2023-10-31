import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/models/Movie_Model.dart';
import 'package:movies_app/models/TopRateMoviesModel.dart';
import 'package:movies_app/screens/Movie_Details.dart';
import 'package:movies_app/shared/Bloc/states/Home%20States.dart';
import 'package:http/http.dart' as http;

import '../../../models/NowPlayingResponse.dart';
import '../../component/costants.dart';


class Home_Cubite extends Cubit<Home_States>{
  Home_Cubite():super(HomeInitState());
  List<Results> nowPlaying=[];
  List<String> slideimage=[];


  static Home_Cubite get(context)=>BlocProvider.of(context);


     Future<void>getNowPlayingMoive()async{
       emit(HomeLoadingState());
       Uri url=Uri.https(Constants.Base_Url,"/3/trending/movie/day",{
        "api_key":Constants.Api_Key
      });
       http.get(url).then((response) {
        var jsondata = jsonDecode(response.body);
        Movies nowPlayingResponse = Movies.fromJson(jsondata);
        nowPlaying=nowPlayingResponse.results??[];
        emit(HomeMovieSucssesState());

       }).catchError((e){
         emit(HomeMovieFaluierState(e.toString()));
      });
      }
      void navigate_movie(BuildContext context,String image,String tittle,String overview,double voteAverage){
       Navigator.pushNamed(context, Movie_Details.routeName,arguments: Movie_Model(image, tittle, overview, voteAverage));

      }
  }







  class Toprated_Cubit extends Cubit<Home_States>{
  Toprated_Cubit():super(HomeInitState());
  List<Result> toprated=[] ;

  static Toprated_Cubit get(context)=>BlocProvider.of(context);

  Future<void>TopRatedMoive()async{
    emit(HomeLoadingState());
    Uri url=Uri.https(Constants.Base_Url,"/3/tv/top_rated",{
      "api_key":Constants.Api_Key
    });
    http.get(url).then((response){
      var jsondata=jsonDecode(response.body);
      TopRateMoviesModel topRateMoviesModel=TopRateMoviesModel.fromJson(jsondata);
      toprated=topRateMoviesModel.results??[];
      emit(HomeTopRatedSucssesState());
    }).catchError((e){
      emit(HomeTopRatedFaluierState(e.toString()));
    });
  }
  void onMarkTap(int count,String yellomark,String mark){
    if(count%2==0){
      emit(AddMovieFavorite(yellomark));
    }
    else{
      emit(Initmark(mark));
    }

  }



  }

