import 'package:cinetopia/app/models/movie.dart';
import 'package:cinetopia/app/services/search_movies_service.dart';

// viewmodel implementa o serviço em funções, só que separando o dá lógica interna, permitindo manter uma independencia de classes
class SearchMovieViewmodel {
  List<Movie> _moviesList = <Movie>[];

  Future<List<Movie>> getPopularMovies() async {
    final SearchMoviesService service =
        SearchPopularMoviesService(); // Serviço de filmes populares

    _moviesList = await service.getMovies();
    return _moviesList;
  }

  List<Movie> get moviesList => _moviesList;

  Future<List<Movie>> getMovie(String query) async {
    if (query.isEmpty) {
      _moviesList =
          await getPopularMovies(); // buscando a propria função da viewmodel, pega os filmes populares
    } else {
      final SearchMoviesService service = SearchForMovie(
        query: query,
      ); // Serviço de busca com query
      _moviesList = await service.getMovies();
    }
    return _moviesList;
  }

  Future<List<Movie>> getUpcomingMovies() async {
    final SearchMoviesService service =
        SearchUpcomingMovies(); // serviço que busca os filmes que serão lançados
    _moviesList = await service.getMovies();
    return _moviesList;
  }
}
