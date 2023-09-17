import 'package:flutter/material.dart';
import 'package:movies_app/screens/items/Search_Item.dart';

import '../shared/network/Api_Manger.dart';


class Search_Screen extends StatefulWidget {
  static const String routeName = "search";

  @override
  State<Search_Screen> createState() => _Search_ScreenState();
}

class _Search_ScreenState extends State<Search_Screen> {
  var searchController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            child: TextField(
              onChanged: (value) {
                setState(() {
                });
                searchController.text=value;

              },
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
            child: FutureBuilder(future: Api_Manager.getSearch(searchController.text),
              builder: (context, snapshot) {
                if(snapshot.connectionState==ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(),);
                }
                if(snapshot.hasError){
                  return Center(child: Text("Smothing Wrong"),);
                }
                var searchData=snapshot.data!.results??[];
                return ListView.separated(itemBuilder: (context, index) {
                  return Search_Item(searchData[index]);
                },itemCount: searchData.length,
                separatorBuilder: (context, index) {
                  return Divider(color: Colors.grey,endIndent: 25,indent: 25,thickness: 2,height: 2);
                },);
              }
              ,),
          )

        ],
      ),
    );
  }
}
