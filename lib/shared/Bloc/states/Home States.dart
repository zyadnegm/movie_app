import 'dart:ui';

abstract class Home_States{}

class HomeInitState extends Home_States{}
class HomeLoadingState extends Home_States{}
class HomeMovieSucssesState extends Home_States{}
class HomeMovieSlideImageState extends Home_States{}

class HomeMovieFaluierState extends Home_States{
  String error;
  HomeMovieFaluierState(this.error);
}
class HomeTopRatedSucssesState extends Home_States{}
class HomeTopRatedFaluierState extends Home_States{
  String error;
  HomeTopRatedFaluierState(this.error);
}
class AddMovieFavorite extends Home_States{
  String yeelomark;

  AddMovieFavorite(this.yeelomark);
}
class Initmark extends Home_States{
  String mark;
  Initmark(this.mark);
}