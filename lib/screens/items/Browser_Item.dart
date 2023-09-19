import 'package:flutter/material.dart';
import '../../models/Browser_Model.dart';
import '../../shared/component/costants.dart';

class Browser_Item extends StatelessWidget {
  Genres genres;
  Browser_Item(this.genres);

  @override
  Widget build(BuildContext context) {

    return Text(genres.name??"",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),);
  }

}
