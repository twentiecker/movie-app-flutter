import 'package:ditonton_flutter/common/constants.dart';
import 'package:ditonton_flutter/common/state_enum.dart';
import 'package:ditonton_flutter/common/utils.dart';
import 'package:ditonton_flutter/presentation/bloc/movies/watchlist_movie/movie_list/movie_list_bloc.dart';
import 'package:ditonton_flutter/presentation/bloc/shows/watchlist_show/show_list/show_list_bloc.dart';
import 'package:ditonton_flutter/presentation/provider/shows/watchlist_show_notifier.dart';
import 'package:ditonton_flutter/presentation/provider/movies/watchlist_movie_notifier.dart';
import 'package:ditonton_flutter/presentation/widgets/movie_card_list.dart';
import 'package:ditonton_flutter/presentation/widgets/show_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class WatchlistPage extends StatefulWidget {
  static const ROUTE_NAME = '/watchlist';

  @override
  _WatchlistPageState createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage> with RouteAware {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        // Provider.of<WatchlistMovieNotifier>(context, listen: false)
        //     .fetchWatchlistMovies());
    context.read<MovieListBloc>().add(OnGetWatchlistMovies()));

    Future.microtask(() =>
        context.read<ShowListBloc>().add(OnGetWatchlistShows()));
        // Provider.of<WatchlistShowNotifier>(context, listen: false)
        //     .fetchWatchlistShows());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  void didPopNext() {
    // Provider.of<WatchlistMovieNotifier>(context, listen: false)
    //     .fetchWatchlistMovies();
    // Provider.of<WatchlistShowNotifier>(context, listen: false)
    //     .fetchWatchlistShows();
    context.read<MovieListBloc>().add(OnGetWatchlistMovies());
    context.read<ShowListBloc>().add(OnGetWatchlistShows());

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlist'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Movies',
                style: kHeading6,
              ),
            ),
            Expanded(
              child: BlocBuilder<MovieListBloc, MovieListState>(
                builder: (context, state) {
                  if (state is MovieListLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is MovieListHasData) {
                    final result = state.result;
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        final movie = result[index];
                        return MovieCard(movie);
                      },
                      itemCount: result.length,
                    );
                  } else if (state is MovieListError) {
                    return  Center(
                      child: Text(state.message),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              // Consumer<WatchlistMovieNotifier>(
              //   builder: (context, data, child) {
              //     if (data.watchlistState == RequestState.Loading) {
              //       return const Center(
              //         child: CircularProgressIndicator(),
              //       );
              //     } else if (data.watchlistState == RequestState.Loaded) {
              //       return ListView.builder(
              //         itemBuilder: (context, index) {
              //           final movie = data.watchlistMovies[index];
              //           return MovieCard(movie);
              //         },
              //         itemCount: data.watchlistMovies.length,
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'TV Series',
                style: kHeading6,
              ),
            ),
            Expanded(
              child: BlocBuilder<ShowListBloc, ShowListState>(
                builder: (context, state) {
                  if (state is ShowListLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is ShowListHasData) {
                    final result = state.result;
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        final show = result[index];
                        return ShowCard(show);
                      },
                      itemCount: result.length,
                    );
                  } else if (state is ShowListError) {
                    return  Center(
                      child: Text(state.message),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              // Consumer<WatchlistShowNotifier>(
              //   builder: (context, data, child) {
              //     if (data.watchlistState == RequestState.Loading) {
              //       return const Center(
              //         child: CircularProgressIndicator(),
              //       );
              //     } else if (data.watchlistState == RequestState.Loaded) {
              //       return ListView.builder(
              //         itemBuilder: (context, index) {
              //           final show = data.watchlistShows[index];
              //           return ShowCard(show);
              //         },
              //         itemCount: data.watchlistShows.length,
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
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
