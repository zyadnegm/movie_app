

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/screens/items/Browser_Item.dart';
import 'package:movies_app/shared/Bloc/Cubit/BrowserCubit.dart';
import 'package:movies_app/shared/Bloc/states/Home%20States.dart';

import '../shared/component/costants.dart';

class BrowserScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    List<Image>brwoser_Images=[
      Image(fit: BoxFit.fill,
        image: NetworkImage(
            "${Constants.Image_Url}${"/iiXliCeykkzmJ0Eg9RYJ7F2CWSz.jpg"}"),
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
            "${Constants.Image_Url}${"/55Rb9qt3yzyF4KQpC1c3T3Fbcao.jpg"}"),
        width: 150,
        height: 200,
      ),
      Image(fit: BoxFit.fill,
        image: NetworkImage(
            "${Constants.Image_Url}${"/iIkogEFPujTQT2A35jG5Q5A7chv.jpg"}"),
        width: 150,
        height: 200,
      ),
      Image(fit: BoxFit.fill,
        image: NetworkImage(
            "${Constants.Image_Url}${"/CyM5FBycEDeIDZi22EkM67ByNy.jpg"}"),
        width: 150,
        height: 200,
      ),
      Image(fit: BoxFit.fill,
        image: NetworkImage(
            "${Constants.Image_Url}${"/w2nFc2Rsm93PDkvjY4LTn17ePO0.jpg"}"),
        width: 150,
        height: 200,
      ),
      Image(fit: BoxFit.fill,
        image: NetworkImage(
            "${Constants.Image_Url}${"/c0MTj7GxwuBujjSsdRQ9i1OstLl.jpg"}"),
        width: 150,
        height: 200,
      ),
      Image(fit: BoxFit.fill,
        image: NetworkImage(
            "${Constants.Image_Url}${"/mQLVpcaVBqiAbKK2MGawCtIwFW0.jpg"}"),
        width: 150,
        height: 200,
      ),
      Image(fit: BoxFit.fill,
        image: NetworkImage(
            "${Constants.Image_Url}${"/bzKzDqV7m8MLWN7G4oZdgIFDHxf.jpg"}"),
        width: 150,
        height: 200,
      ),
      Image(fit: BoxFit.fill,
        image: NetworkImage(
            "${Constants.Image_Url}${"/9m161GawbY3cWxe6txd1NOHTjd0.jpg"}"),
        width: 150,
        height: 200,
      ),

    ];
    return Scaffold(
      body: BlocProvider(
        create: (context) => BrowserCubit()..Browser_Data(),
        child: BlocBuilder<BrowserCubit,Home_States>(
      builder: (context, state) {
        if(state is HomeInitState){
          return Center(child: CircularProgressIndicator(),);
        }
        else if(state is HomeMovieSucssesState){
          return GridView.builder(
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 3,
              crossAxisSpacing: 3,
            ),
            itemBuilder: (context, index) {
              return Stack(alignment: Alignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                      margin: EdgeInsets.all(13),
                      child: brwoser_Images[index]),
                  Browser_Item(BrowserCubit.get(context).browserdata[index])
                ],
              );
            },
          );
        }
        return Scaffold();

      },
      ),
      ),

    );
  }
}
