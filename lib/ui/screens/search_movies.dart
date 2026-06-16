import 'package:cinetopia/app/viewmodels/search_movie_viewmodel.dart';
import 'package:cinetopia/ui/components/movie_card.dart';
import 'package:flutter/material.dart';

class SearchMovies extends StatefulWidget {
  SearchMovies({super.key});

  @override
  State<SearchMovies> createState() => _SearchMoviesState();
}

class _SearchMoviesState extends State<SearchMovies> {
  final SearchMovieViewmodel viewmodel = SearchMovieViewmodel();

  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: viewmodel.getMovie(textController.text),
      builder: (context, asyncSnapshot) {
        final movies = asyncSnapshot.data;
        if (asyncSnapshot.hasData) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Image.asset("assets/popular.png", height: 80, width: 80),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "Filmes populares",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 24),
                  child: TextField(
                    controller: textController,
                    onEditingComplete: () {
                      FocusScope.of(context).unfocus();
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      hintText: "Pesquisar",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              SliverList.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: ((context, index) {
                  final movie = movies![index];
                  return MovieCard(movie: movie);
                }),
                itemCount: movies?.length,
              ),
            ],
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
