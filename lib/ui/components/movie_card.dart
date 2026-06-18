import 'package:cinetopia/app/models/movie.dart';
import 'package:cinetopia/ui/screens/movie_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    // Colocando o card de movies dentro do Ink permite inserir um InkWell que possui a opção onTap, onde redirecionaremos a página para MoviePage
    return Ink(
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MoviePage(movieId: movie.id),
          ), // A movie page recebe o id do filme no qual a página abrirá
        ),
        child: Row(
          children: [
            Container(
              width: 90,
              height: 120,
              decoration: BoxDecoration(
                color: Color(0xFF000000),
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(movie.getPosterImage()),
                  fit: BoxFit.cover,
                ),
              ),
              margin: const EdgeInsets.only(right: 16),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Text(
                    movie.title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  movie.releaseDate,
                  style: TextStyle(color: Color(0xFFA5A5A5)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
