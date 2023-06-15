part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeErrorState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<MovieEntity> movies;

  HomeSuccessState(this.movies);
}

abstract class HomeActionState extends HomeState {}

class HomeNavigateWatchlistState extends HomeActionState {}

class HomeLikeButtonClickState extends HomeActionState {
  HomeLikeButtonClickState(id);

  get id => id;
}
