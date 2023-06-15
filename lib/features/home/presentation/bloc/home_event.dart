part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeWatchListButtonClickEvent extends HomeEvent {}

class HomeLikeButtonClickEvent extends HomeEvent {
  final int id;
  HomeLikeButtonClickEvent({required this.id});
}
