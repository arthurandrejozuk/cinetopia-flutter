import 'dart:convert';

import 'package:cinetopia/app/helpers/consts.dart';

class Movie {
  final int id;
  final String title;
  final String image;
  final String releaseDate;
  final String overview;
  Movie({
    required this.id,
    required this.title,
    required this.image,
    required this.releaseDate,
    required this.overview,
  });

  String getPosterImage() {
    return imageUrlPrefix + image;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'releaseDate': releaseDate,
      'overview': overview,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id'] as int,
      title: map['title'] as String,
      image: map["poster_path"] as String,
      releaseDate: map['release_date'] as String,
      overview: map['overview'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) =>
      Movie.fromMap(json.decode(source) as Map<String, dynamic>);
}
