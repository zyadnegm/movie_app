import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/models/TopRateMoviesModel.dart';
import 'package:movies_app/models/watchlist_Model.dart';
import 'package:movies_app/shared/Bloc/states/Home%20States.dart';
import 'package:movies_app/shared/network/firebase/firebase_function.dart';

class WatchListCubit extends Cubit<Home_States>{
  WatchListCubit():super(HomeInitState());



  static WatchListCubit get(context)=>BlocProvider.of(context);

  void add_movie(){
  }

}