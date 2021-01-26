
import 'dart:convert';

Model modelFromJson(String str) => Model.fromJson(json.decode(str));

String modelToJson(Model data) => json.encode(data.toJson());

class Model {
  Model({
    this.articles,
  });

  List<Article> articles;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
      
        articles:
            List<Article>.from(json["results"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        
        "results": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class Article {
  Article({
    this.artist,
    this.urlToImage,
    this.trackName,
    this.genre,
    this.price,
    this.song
  });

  String urlToImage;
  String trackName;
  String artist;
  String genre;
  int price;
  String song;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
      urlToImage: json["artworkUrl100"],
      trackName: json["trackName"],
      artist: json["artistName"],
      genre: json['primaryGenreName'],
      
       song: json["previewUrl"],
      );

  Map<String, dynamic> toJson() => {
        "artworkUrl100": urlToImage,
        "trackName": trackName,
        "artistName": artist,
        "primaryGenreName": genre,
        
         "previewUrl": song,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
