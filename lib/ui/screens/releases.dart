import 'package:cinetopia/app/viewmodels/search_movie_viewmodel.dart';
import 'package:cinetopia/ui/components/movie_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Releases extends StatefulWidget {
  const Releases({super.key});

  @override
  State<Releases> createState() => _ReleasesState();
}

class _ReleasesState extends State<Releases> {
  SearchMovieViewmodel viewmodel = SearchMovieViewmodel();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Finalizando, chamando o viewmodel
      future: viewmodel.getUpcomingMovies(),
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
                      "Lançamentos",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
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
