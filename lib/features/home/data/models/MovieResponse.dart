import 'package:tmdb/features/home/data/models/movie.dart';

class MovieResponse {
  int page;
  List<Movie> movies;
  int totalPages;
  int totalResults;

  MovieResponse({
    required this.page,
    required this.movies,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> map) {
    return MovieResponse(
      page: map['page'] as int,
      movies: List<Movie>.from((map['results'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))),
      totalPages: map['total_pages'] as int,
      totalResults: map['total_results'] as int,
    );
  }
}
