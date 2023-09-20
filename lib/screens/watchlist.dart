

import 'package:flutter/material.dart';
import 'package:movies_app/screens/items/WatchList_Item.dart';
import 'package:movies_app/shared/network/firebase/firebase_function.dart';

class Watch_List extends StatelessWidget {
  const Watch_List({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(future: Firebase_Function.getMovie(),
      builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        }
        if(snapshot.hasError){
          return Center(child: Text("Somthing has error"),);
        }
        var movieList=snapshot.data!.docs.map((e) => e.data()).toList();
        return ListView.separated(separatorBuilder: (context, index) {
          return Divider(color: Colors.white,indent: 30,endIndent: 30,height: 3,thickness: 1,);
        },
          itemBuilder: (context, index) {
          return WatchList_Item(movieList[index]);
        },itemCount: movieList.length,);
      },),
    );
  }
}
