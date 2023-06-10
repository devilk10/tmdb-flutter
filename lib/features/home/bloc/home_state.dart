part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeErrorState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<Movie> movies;

  HomeSuccessState(this.movies);
}

abstract class HomeActionState extends HomeState {}
// add other action states below and they'll extend HomeActionState
