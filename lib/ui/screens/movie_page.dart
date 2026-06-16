import 'package:cinetopia/app/helpers/consts.dart';
import 'package:cinetopia/app/viewmodels/details_movie_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoviePage extends StatefulWidget {
  final int movieId;

  const MoviePage({super.key, required this.movieId});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    final DetailsMovieViewmodel viewmodel = DetailsMovieViewmodel();
    return FutureBuilder(
      future: viewmodel.getDetailMovie(widget.movieId.toString()),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        final movie = asyncSnapshot.data!;
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(color: Color(0xFF1D0E44)),
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/movie.png", height: 90, width: 90),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        movie.title,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: 180,
                      height: 240,
                      decoration: BoxDecoration(
                        color: Color(0xFF000000),
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: NetworkImage(baseImageUrl + movie.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                      margin: const EdgeInsets.only(right: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      spacing: 12,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Descrição", style: TextStyle(fontSize: 20)),
                        Text(movie.overview),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
