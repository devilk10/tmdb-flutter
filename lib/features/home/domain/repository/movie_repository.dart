import 'package:tmdb/core/domain/enitities/movie.dart';

abstract class MovieRepository {
  Future<List<MovieEntity>> fetchPopularMovies();

  void addFavouriteMovie(MovieEntity movieEntity);
}
