import 'package:cinetopia/app/models/movie.dart';
import 'package:cinetopia/app/services/search_movies_service.dart';

class DetailsMovieViewmodel {
  Future<Movie> getDetailMovie(String id) async {
    if (id.isEmpty) {
      throw Exception("Erro de busca com id: $id");
    } else {
      return await MovieDetailId(movieId: id).getMovie();
    }
  }
}
