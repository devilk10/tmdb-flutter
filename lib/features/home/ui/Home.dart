// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/features/home/bloc/home_bloc.dart';
import 'package:tmdb/features/home/ui/widgets/movie_card.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
        bloc: homeBloc,
        buildWhen: (previous, current) => current is! HomeActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case HomeLoadingState:
              return const Scaffold(
                  body: Center(
                child: CircularProgressIndicator(),
              ));
            case HomeSuccessState:
              final successState = state as HomeSuccessState;
              return Scaffold(
                appBar: AppBar(
                  title: const Text("TMDB app"),
                  actions: [
                    IconButton(
                        onPressed: () {
                          print("Watchlist page");
                        },
                        icon: const Icon(Icons.favorite_border)),
                  ],
                ),
                body: ListView.builder(
                    itemCount: successState.movies.length,
                    itemBuilder: (context, index) {
                      return MovieCard(movie: successState.movies[index]);
                    }),
              );
            case HomeErrorState:
              return const Text("Error");
            default:
              return const Scaffold(
                  body: Center(
                child: Text("Initial state"),
              ));
          }
        });
  }
}
