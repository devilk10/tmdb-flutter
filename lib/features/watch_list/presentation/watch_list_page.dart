import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/features/home/presentation/widgets/movie_card.dart';
import 'package:tmdb/features/watch_list/presentation/cubit/watch_list_cubit.dart';

class WatchList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
  final cubit = WatchListCubit();

  @override
  void initState() {
    super.initState();
    cubit.loadLikedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: cubit,
      buildWhen: (previous, current) => current is WatchListState,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Watchlist"),
          ),
          body: movieLoader(state),
        );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }

  Widget movieLoader(Object? state) {
    switch (state.runtimeType) {
      case WatchListLoadingState:
        return const Center(child: CircularProgressIndicator());
      case WatchListLoadedState:
        var loadedState = state as WatchListLoadedState;
        return ListView.builder(
            itemCount: loadedState.movies.length,
            itemBuilder: (context, index) {
              return MovieCard(
                  movie: loadedState.movies[index],
                  onLiked: () {
                    //unimplemented
                  });
            });
      default:
        return const Text("nothing");
    }
  }
}
