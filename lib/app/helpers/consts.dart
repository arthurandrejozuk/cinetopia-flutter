import 'package:cinetopia/app/api_key.dart';

// Helpers são constantes do projetos, geralmente url ou configurações que serão base para

const String popularMoviesUrl =
    "https://api.themoviedb.org/3/movie/popular?language=en-US&page=1";

const String moviePrefixUrl =
    "https://api.themoviedb.org/3/search/movie?query=";

const requestHeader = {
  "accept": "application/json",
  "Authorization": "Bearer $API_KEY",
};

const String imageUrlPrefix = "https://image.tmdb.org/t/p/w500";

const String movieFilterSulfix = "&include_adult=false&language=en-US&page=1";

const String movieById = "https://api.themoviedb.org/3/movie/";

const String baseImageUrl = "https://image.tmdb.org/t/p/original/";

const String upcomingMoviesUrl = "https://api.themoviedb.org/3/movie/upcoming";
