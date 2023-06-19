import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tmdb/core/domain/enitities/movie.dart';
import 'package:tmdb/features/home/data/repository/movie_repository_impl.dart';
import 'package:tmdb/features/home/domain/repository/movie_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  MovieRepository movieRepository = MovieRepositoryImpl();
  late List<MovieEntity> movies;

  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeLoadingState);
    on<HomeWatchListButtonClickEvent>(homeNavigateWatchlistState);
    on<HomeLikeButtonClickEvent>(homeOnLikeClicked);
  }

  Future<void> homeLoadingState(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await fetchPopularMovies(emit);
  }

  Future<void> fetchPopularMovies(Emitter<HomeState> emit) async {
    try {
      List<MovieEntity> list = await movieRepository.fetchPopularMovies();
      movies = list;
      emit(HomeSuccessState(list));
    } catch (error) {
      print("error - ${error.toString()}");
      emit(HomeErrorState());
    }
  }

  Future<void> homeNavigateWatchlistState(
      HomeWatchListButtonClickEvent event, Emitter<HomeState> emit) async {
    emit(HomeNavigateWatchlistState());
  }

  Future<void> homeOnLikeClicked(
      HomeLikeButtonClickEvent event, Emitter<HomeState> emit) async {
    movies = movies.map((e) {
      if (e.id == event.id) {
        movieRepository.addFavouriteMovie(e);
        e.toggleLiked();
      }
      return e;
    }).toList();
  }
}
