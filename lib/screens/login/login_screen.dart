import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/screens/Home_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';


class Login_Screen extends StatelessWidget {
  static const String routeName = "login";


  @override
  Widget build(BuildContext context) {
    Future<UserCredential> signInWithGoogle() async {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }

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
            Navigator.pushNamed(context, Home_Screen.routeName);
          }, child: Text("Login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Colors.black),),
          style: ButtonStyle(backgroundColor:MaterialStatePropertyAll(Color(0XffFFBB3B)))),
          SizedBox(height: 20,),
          Text("or Login with",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400,color: Colors.white),),
          SizedBox(height: 13,),
          Row(children: [
            InkWell(onTap: () {
              signInWithGoogle();

            },
                child: ClipOval(child: Image.asset("assets/images/Google.png",width: 100,height: 100,),)),

            InkWell(onTap: () {

            },
                child: ClipOval(child: Image.asset("assets/images/Facebook.jpeg",width: 100,height: 100,),)),


          ]
            ,)

          




        ],
      ),
    );
  }
}
