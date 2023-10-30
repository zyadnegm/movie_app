import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies_app/models/watchlist_Model.dart';

class Firebase_Function {
  static CollectionReference<Watchlist_Model> getWatchListCollection() {
    return FirebaseFirestore.instance.collection("watch_list").withConverter(
      fromFirestore: (snapshot, _) {
        return Watchlist_Model.fromJson(snapshot.data()!);
      },
      toFirestore: (value, _) {
        return value.toJson();
      },
    );
  }

  static Future<void> add_movie(Watchlist_Model watch) {
    var collection = getWatchListCollection();
    var document = getWatchListCollection().doc();
    watch.id = document.id;
    return document.set(watch);
  }
  static Stream<QuerySnapshot<Watchlist_Model>> getMovie() {
    return getWatchListCollection().snapshots();
  }
  static Future<void> deleteData(String id) {
    return getWatchListCollection()
        .doc(id)
        .delete()
        .then((value) => "data Deleted")
        .catchError((error) => "Failed to delete user: $error");
  }
  static Future<void> uptadeData(String id, Watchlist_Model watchlist_model) {
    return getWatchListCollection().doc(id).update(watchlist_model.toJson());
  }


  static Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // If the user is already signed in, show the Google sign-in popup again
    if (googleUser != null) {
      await GoogleSignIn().signOut();
    }

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

}

