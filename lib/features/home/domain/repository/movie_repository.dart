import 'package:tmdb/features/home/domain/enitities/movie.dart';

abstract class MovieRepository {
  Future<List<MovieEntity>> fetchPopularMovies();
}
