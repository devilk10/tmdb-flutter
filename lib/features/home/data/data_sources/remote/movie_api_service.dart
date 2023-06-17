import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:tmdb/features/home/data/models/movie.dart';

class MovieApiService {
  Future<List<Movie>> fetchPopularMovies(String apiKey) async {
    final dio = Dio();
    try {
      var response = await dio.get(
        "https://api.themoviedb.org/3/discover/movie",
        queryParameters: {'api_key': apiKey},
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final movieList = response.data['results'];
        return movieList.map<Movie>((json) => Movie.fromJson(json)).toList();
      } else {
        throw Exception(
            'Failed to fetch popular movies. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print("Exceptions $error");
      throw Exception('Failed to fetch popular movies.');
    }
  }
}
