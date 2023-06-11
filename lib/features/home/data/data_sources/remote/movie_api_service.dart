import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tmdb/features/home/data/models/movie.dart';

class MovieApiService {
  Future<List<Movie>> fetchPopularMovies(String apiKey) async {
    final client = http.Client();
    final url = Uri.https(
        'api.themoviedb.org', '/3/discover/movie', {'api_key': apiKey});
    try {
      final http.Response response = await client.get(url);
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final movieList =
            List<Map<String, dynamic>>.from(jsonResponse['results']);
        return movieList.map((json) => Movie.fromJson(json)).toList();
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
