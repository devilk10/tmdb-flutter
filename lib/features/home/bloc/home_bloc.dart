import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tmdb/data/movie_response.dart';

import '../models/Movie.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeLoadingState);
  }

  Future<void> homeLoadingState(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    emit(HomeSuccessState(getMoviesUseCase()));
  }

  List<Movie> getMoviesUseCase() {
    List<Movie> movies = MovieResponse.movieResponse.map((map) {
      return Movie(
        id: map['id'],
        title: map['title'],
        overview: map['overview'],
        posterPath: map['poster_path'],
        voteAverage: map['vote_average'],
      );
    }).toList();
    return movies;
  }
}
