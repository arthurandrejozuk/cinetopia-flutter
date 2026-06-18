import 'dart:convert';

// modelos serão classes que modelarão dados, ou seja, padronizando os dados que serão utilizados, nesse caso em orientação a objeto

import 'package:cinetopia/app/helpers/consts.dart';

class Movie {
  // Dados utilizado no filme
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

  // retorna um mapa, recebendo uma chave em string e um valor dinamico(booleano, string, inteiros etc)
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'releaseDate': releaseDate,
      'overview': overview,
    };
  }

  // retorna agora um objeto de movie com as informações de recebidas do map, agora esperando dados fixos, como int
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
  // Pega a fonte em string e transforma em objeto
  factory Movie.fromJson(String source) =>
      Movie.fromMap(json.decode(source) as Map<String, dynamic>);
}
