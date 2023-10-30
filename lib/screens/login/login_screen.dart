import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies_app/Layout/Home_Layout.dart';
import 'package:movies_app/shared/network/firebase/firebase_function.dart';



class Login_Screen extends StatelessWidget {
  static const String routeName = "login";


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: Image.asset("assets/images/movies.png")),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  fillColor: Color(0XffFFBB3B),
                  filled: true,
                  hintText: "Enter Email..................",
                  hintStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.black)),
            ),
          ),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  fillColor: Color(0XffFFBB3B),
                  filled: true,
                  hintText: "Enter password..................",
                  hintStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.black)),
            ),
          ),
          SizedBox(height: 14,),
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, Home_Layout.routeName);
          }, child: Text("Login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Colors.black),),
          style: ButtonStyle(backgroundColor:MaterialStatePropertyAll(Color(0XffFFBB3B)))),
          SizedBox(height: 20,),
          Text("or Login with",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400,color: Colors.white),),
          SizedBox(height: 13,),
          InkWell(onTap: () {
            Firebase_Function.signInWithGoogle().then((value){
              Navigator.pushReplacementNamed(context, Home_Layout.routeName);
            } );

          },
              child: ClipOval(child: Image.asset("assets/images/Google.png",width: 100,height: 100,),)),


          




        ],
      ),
    );
  }
}
