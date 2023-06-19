import 'package:tmdb/core/domain/enitities/movie.dart';

abstract class WatchListRepository {
  Future<List<MovieEntity>> getLikedMovies();
}
