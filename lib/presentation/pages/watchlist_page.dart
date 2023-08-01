import 'package:ditonton_flutter/common/constants.dart';
import 'package:ditonton_flutter/common/utils.dart';
import 'package:ditonton_flutter/presentation/bloc/movies/watchlist_movie/movie_list/movie_list_bloc.dart';
import 'package:ditonton_flutter/presentation/bloc/shows/watchlist_show/show_list/show_list_bloc.dart';
import 'package:ditonton_flutter/presentation/widgets/movie_card_list.dart';
import 'package:ditonton_flutter/presentation/widgets/show_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchlistPage extends StatefulWidget {
  static const routeName = '/watchlist';

  const WatchlistPage({super.key});

  @override
  WatchlistPageState createState() => WatchlistPageState();
}

class WatchlistPageState extends State<WatchlistPage>
    with RouteAware, TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    Future.microtask(
        () => context.read<MovieListBloc>().add(OnGetWatchlistMovies()));

    Future.microtask(
        () => context.read<ShowListBloc>().add(OnGetWatchlistShows()));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    context.read<MovieListBloc>().add(OnGetWatchlistMovies());
    context.read<ShowListBloc>().add(OnGetWatchlistShows());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlist'),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.transparent,
          labelColor: kMikadoYellow,
          unselectedLabelColor: Colors.white,
          tabs: [
            Tab(
              icon: const Icon(Icons.movie),
              child: Text(
                'Movies',
                style: kSubtitle,
              ),
            ),
            Tab(
              icon: const Icon(Icons.tv),
              child: Text(
                'TV Series',
                style: kSubtitle,
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                        return Center(
                          child: Text(state.message),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                        return Center(
                          child: Text(state.message),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
