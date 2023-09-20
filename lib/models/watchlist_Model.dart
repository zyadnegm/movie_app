class Watchlist_Model {
  String tittle;
  String image;
  String id;
  bool isdond;

  Watchlist_Model(
      {required this.tittle,
        required this.image,
        this.id = "",
        this.isdond = false,
       });

  Watchlist_Model.fromJson(Map<String, dynamic> json)
      : this(
      id: json["id"],
      tittle: json["tittle"],
      image: json["image"],
      isdond: json["isdond"],
     );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "tittle": tittle,
      "image": image,
      "isdond": isdond,
    };
  }
}