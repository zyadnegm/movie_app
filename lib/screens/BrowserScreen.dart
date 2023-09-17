

import 'package:flutter/material.dart';
import 'package:movies_app/screens/items/Browser_Item.dart';
import 'package:movies_app/shared/network/Api_Manger.dart';

import '../shared/component/costants.dart';

class BrowserScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(future: Api_Manager.Browser_Data(),
      builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        }
        if(snapshot.hasError){
          return Center(child: Text("Somthing has error"),);
        }
        var brwoserdata=snapshot.data!.genres??[];
        return GridView.builder(
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2
          ),
          itemBuilder: (context, index) {
            return Browser_Item(brwoserdata[index],[
              Image(fit: BoxFit.fill,
                image: NetworkImage(
                    "${Constants.Image_Url}${"/ctMserH8g2SeOAnCw5gFjdQF8mo.jpg"}"),
                width: 150,
                height: 200,
              ),
              Image(fit: BoxFit.fill,
                image: NetworkImage(
                    "${Constants.Image_Url}${"/ctMserH8g2SeOAnCw5gFjdQF8mo.jpg"}"),
                width: 150,
                height: 200,
              ),
              Image(fit: BoxFit.fill,
                image: NetworkImage(
                    "${Constants.Image_Url}${"/ctMserH8g2SeOAnCw5gFjdQF8mo.jpg"}"),
                width: 150,
                height: 200,
              ),
              Image(fit: BoxFit.fill,
                image: NetworkImage(
                    "${Constants.Image_Url}${"/ctMserH8g2SeOAnCw5gFjdQF8mo.jpg"}"),
                width: 150,
                height: 200,
              ),
              Image(fit: BoxFit.fill,
                image: NetworkImage(
                    "${Constants.Image_Url}${"/ctMserH8g2SeOAnCw5gFjdQF8mo.jpg"}"),
                width: 150,
                height: 200,
              ),
              Image(fit: BoxFit.fill,
                image: NetworkImage(
                    "${Constants.Image_Url}${"/ctMserH8g2SeOAnCw5gFjdQF8mo.jpg"}"),
                width: 150,
                height: 200,
              ),
              Image(fit: BoxFit.fill,
                image: NetworkImage(
                    "${Constants.Image_Url}${"/ctMserH8g2SeOAnCw5gFjdQF8mo.jpg"}"),
                width: 150,
                height: 200,
              ),
              Image(fit: BoxFit.fill,
                image: NetworkImage(
                    "${Constants.Image_Url}${"/ctMserH8g2SeOAnCw5gFjdQF8mo.jpg"}"),
                width: 150,
                height: 200,
              ),
              Image(fit: BoxFit.fill,
                image: NetworkImage(
                    "${Constants.Image_Url}${"/ctMserH8g2SeOAnCw5gFjdQF8mo.jpg"}"),
                width: 150,
                height: 200,
              ),
              Image(fit: BoxFit.fill,
                image: NetworkImage(
                    "${Constants.Image_Url}${"/ctMserH8g2SeOAnCw5gFjdQF8mo.jpg"}"),
                width: 150,
                height: 200,
              ),

            ]);
          },
        );
      },),

    );
  }
}
