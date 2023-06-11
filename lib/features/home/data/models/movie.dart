import 'package:tmdb/features/home/domain/enitities/movie.dart';

class Movie extends MovieEntity {
  Movie(
      {required super.id,
      required super.title,
      required super.overview,
      required super.posterPath,
      required super.voteAverage});

  factory Movie.fromJson(Map<String, dynamic> map) {
    return Movie(
        id: map['id'] ?? "",
        title: map['title'] ?? "",
        overview: map['overview'] ?? "",
        posterPath: map['poster_path'] ?? "",
        voteAverage: map['vote_average'] ?? "");
  }
}
