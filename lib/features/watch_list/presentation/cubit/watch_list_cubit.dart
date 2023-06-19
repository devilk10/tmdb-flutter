import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tmdb/core/domain/enitities/movie.dart';
import 'package:tmdb/features/watch_list/data/repository/watch_list_repository_impl.dart';
import 'package:tmdb/features/watch_list/domain/repository/watch_list_repository.dart';

part 'watch_list_state.dart';

class WatchListCubit extends Cubit<WatchListState> {
  final WatchListRepository repo = WatchListRepositoryImpl();

  WatchListCubit() : super(WatchListInitial());

  Future<void> loadLikedMovies() async {
    emit(WatchListLoadingState());
    final List<MovieEntity> list = await repo.getLikedMovies();
    emit(WatchListLoadedState(list));
  }
}
