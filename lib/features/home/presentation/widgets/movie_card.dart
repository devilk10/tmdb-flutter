import 'package:flutter/material.dart';
import 'package:tmdb/core/domain/enitities/movie.dart';
import 'package:tmdb/core/util/constants.dart';

class MovieCard extends StatelessWidget {
  MovieEntity movie;
  final Function() onLiked;

  MovieCard({required this.movie, required this.onLiked});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(5, 2, 5, 2),
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: Colors.lightBlue)),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(Constants.BASE_IMAGE_URL_FACE +
                                movie.posterPath))))),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    movie.title,
                    maxLines: 1,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    movie.overview,
                    maxLines: 2,
                  )
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: GestureDetector(
                    onTap: onLiked,
                    child: movie.liked
                        ? const Icon(Icons.favorite_sharp)
                        : const Icon(Icons.favorite_border))),
          ],
        ));
  }
}
