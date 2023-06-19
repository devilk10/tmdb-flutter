import 'package:tmdb/features/home/data/data_sources/remote/movie_api_service.dart';
import 'package:tmdb/features/home/data/models/movie.dart';
import 'package:tmdb/features/home/domain/repository/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final apiService = MovieApiService();
  String apiKey = '';

  @override
  Future<List<Movie>> fetchPopularMovies() async {
    try {
      return await apiService.fetchPopularMovies(apiKey);
    } catch (exception) {
      throw Exception('Failed to get movies: $exception');
    }
  }

  @override
  void addFavouriteMovie(MovieEntity movieEntity) async {
    await Future.delayed(const Duration(seconds: 3));
  }
}
