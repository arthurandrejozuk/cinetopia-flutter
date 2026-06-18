// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import "package:http/http.dart" as http;

import 'package:cinetopia/app/helpers/consts.dart';
import 'package:cinetopia/app/models/movie.dart';

// Serviços será a parte de busca dos dados

//classe abstrata para padronização dos serviços
abstract class SearchMoviesService {
  Future<List<Movie>> getMovies();
}

// implementação da classe abstrata
// cada classe possui sua responsabilidade, SearchPopularMoviesService fará a busca de filmes populares
class SearchPopularMoviesService extends SearchMoviesService {
  List<Movie> movies = <Movie>[];

  @override
  Future<List<Movie>> getMovies() async {
    try {
      final response = await http.get(
        Uri.parse(popularMoviesUrl),
        headers: requestHeader,
      );
      if (response.statusCode == 200) {
        for (dynamic movie in json.decode(response.body)["results"]) {
          movies.add(Movie.fromMap(movie));
        }
      } else {
        throw Exception(response.body);
      }
      return movies;
    } catch (err) {
      print(err);
      return movies;
    }
  }
}

// Por diante a mesma implementação mudando apenas a url e a lógica interna, recebendo a query
class SearchForMovie implements SearchMoviesService {
  List<Movie> movies = <Movie>[];

  final String query;
  SearchForMovie({required this.query});

  @override
  Future<List<Movie>> getMovies() async {
    try {
      final response = await http.get(
        Uri.parse(moviePrefixUrl + query + movieFilterSulfix),
        headers: requestHeader,
      );
      if (response.statusCode == 200) {
        for (dynamic movie in json.decode(response.body)["results"]) {
          movies.add(Movie.fromMap(movie));
        }
      } else {
        throw Exception(response.body);
      }
      return movies;
    } catch (err) {
      print(err);
      return movies;
    }
  }
}

// apenas alterando a url
class SearchUpcomingMovies implements SearchMoviesService {
  List<Movie> movies = <Movie>[];
  @override
  Future<List<Movie>> getMovies() async {
    try {
      final response = await http.get(
        Uri.parse(upcomingMoviesUrl),
        headers: requestHeader,
      );
      if (response.statusCode == 200) {
        for (dynamic movie in json.decode(response.body)["results"]) {
          movies.add(Movie.fromMap(movie));
        }
      } else {
        throw Exception(response.body);
      }
      return movies;
    } catch (err) {
      print(err);
      return movies;
    }
  }
}
