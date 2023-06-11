import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tmdb/features/home/data/repository/movie_repository_impl.dart';
import 'package:tmdb/features/home/domain/enitities/movie.dart';
import 'package:tmdb/features/home/domain/repository/movie_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  MovieRepository movieRepository = MovieRepositoryImpl();

  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeLoadingState);
  }

  Future<void> homeLoadingState(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await fetchPopularMovies(emit);
  }

  Future<void> fetchPopularMovies(Emitter<HomeState> emit) async {
    try {
      List<MovieEntity> list = await movieRepository.fetchPopularMovies();
      emit(HomeSuccessState(list));
    } catch (error) {
      print("error - ${error.toString()}");
      emit(HomeErrorState());
    }
  }
}
