import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/screens/items/Search_Item.dart';
import 'package:movies_app/shared/Bloc/Cubit/SearchCubit.dart';

import '../shared/Bloc/states/Home States.dart';



class Search_Screen extends StatelessWidget {
  static const String routeName="search";

  @override
  Widget build(BuildContext context) {

    var query=TextEditingController();
    query.addListener(() {
      if(query.text.isNotEmpty){
        SearchCubit.get(context).getSearch(query.text);
      }
    });
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            child: TextField(
              controller: query,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  fillColor: Colors.grey,

                  filled: true,
                  prefixIcon: Icon(Icons.search, size: 30, color: Colors.white),
                  labelText: "Search",
                  labelStyle: TextStyle(fontWeight: FontWeight.w400,color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                      gapPadding: 20,
                      borderRadius: BorderRadius.circular(27),
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(27),
                      borderSide: BorderSide(color: Colors.white))),
            ),
          ),
          Expanded(
            child: BlocBuilder<SearchCubit,Home_States>(builder:(context, state) {
              if(state is HomeLoadingState){
                return Center(child: CircularProgressIndicator(),);
              }
              else if(state is HomeMovieSucssesState){
                return ListView.separated(itemBuilder: (context, index) {
                  return Search_Item(SearchCubit.get(context).serchdata[index]);
                }, separatorBuilder: (context, index) {
                  return Divider(color: Colors.grey,endIndent: 25,indent: 25,thickness: 2,height: 2);

                }, itemCount: SearchCubit.get(context).serchdata.length);
              }
              else if(state is HomeMovieFaluierState){
                return Text("somthing error");
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Container(
                    child: Image.asset("assets/images/nomovie.png",fit: BoxFit.fill,),
                    height: 130,
                  ),
                  SizedBox(height: 8,),
                  Text("No Movies found",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.white,fontSize: 15),)
                ],
              );

            },
            ),
          )


        ],
      ),
    );
  }
}