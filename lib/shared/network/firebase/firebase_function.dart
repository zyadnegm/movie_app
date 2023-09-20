import 'package:cloud_firestore/cloud_firestore.dart';
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
  }  static Future<void> deleteData(String id) {
    return getWatchListCollection()
        .doc(id)
        .delete()
        .then((value) => "data Deleted")
        .catchError((error) => "Failed to delete user: $error");
  }
  static Future<void> uptadeData(String id, Watchlist_Model watchlist_model) {
    return getWatchListCollection().doc(id).update(watchlist_model.toJson());
  }
}

