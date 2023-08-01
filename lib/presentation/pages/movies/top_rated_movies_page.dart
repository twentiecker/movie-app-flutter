import 'package:ditonton_flutter/presentation/widgets/movie_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/movies/top_rated_movies/top_rated_movies_bloc.dart';

class TopRatedMoviesPage extends StatefulWidget {
  static const routeName = '/top-rated-movie';

  const TopRatedMoviesPage({super.key});

  @override
  TopRatedMoviesPageState createState() => TopRatedMoviesPageState();
}

class TopRatedMoviesPageState extends State<TopRatedMoviesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => context.read<TopRatedMoviesBloc>().add(OnTopRatedMovies()));
    // Provider.of<TopRatedMoviesNotifier>(context, listen: false)
    //     .fetchTopRatedMovies());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Rated Movies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TopRatedMoviesBloc, TopRatedMoviesState>(
          builder: (context, state) {
            if (state is TopRatedLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TopRatedHasData) {
              final result = state.result;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final movie = result[index];
                  return MovieCard(movie);
                },
                itemCount: result.length,
              );
            } else if (state is TopRatedError) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return Container();
            }
          },
        ),
        // Consumer<TopRatedMoviesNotifier>(
        //   builder: (context, data, child) {
        //     if (data.state == RequestState.Loading) {
        //       return const Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     } else if (data.state == RequestState.Loaded) {
        //       return ListView.builder(
        //         itemBuilder: (context, index) {
        //           final movie = data.movies[index];
        //           return MovieCard(movie);
        //         },
        //         itemCount: data.movies.length,
        //       );
        //     } else {
        //       return Center(
        //         key: const Key('error_message'),
        //         child: Text(data.message),
        //       );
        //     }
        //   },
        // ),
      ),
    );
  }
}
