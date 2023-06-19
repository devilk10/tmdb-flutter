part of 'watch_list_cubit.dart';

@immutable
abstract class WatchListState {}

class WatchListInitial extends WatchListState {}

class WatchListLoadingState extends WatchListState {}

class WatchListLoadedState extends WatchListState {
  final List<MovieEntity> movies;

  WatchListLoadedState(this.movies);
}

class WatchListErrorState extends WatchListState {}
