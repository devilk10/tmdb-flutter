import 'package:tmdb/core/data/models/models/movie.dart';
import 'package:tmdb/features/watch_list/domain/repository/watch_list_repository.dart';

class WatchListRepositoryImpl extends WatchListRepository {
  @override
  Future<List<Movie>> getLikedMovies() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      Movie(
          id: 1234,
          title: "title",
          overview: "lorem ipsum",
          posterPath: "/kRlqWz54iI9K1PjI15cwvtHjnSw.jpg",
          voteAverage: 1.2,
          liked: true)
    ];
  }
}
