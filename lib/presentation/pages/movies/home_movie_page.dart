import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton_flutter/common/constants.dart';
import 'package:ditonton_flutter/domain/entities/movies/movie.dart';
import 'package:ditonton_flutter/presentation/bloc/movies/now_playing_movies/now_playing_movies_bloc.dart';
import 'package:ditonton_flutter/presentation/bloc/movies/popular_movies/popular_movies_bloc.dart';
import 'package:ditonton_flutter/presentation/bloc/movies/top_rated_movies/top_rated_movies_bloc.dart';
import 'package:ditonton_flutter/presentation/pages/about_page.dart';
import 'package:ditonton_flutter/presentation/pages/shows/home_show_page.dart';
import 'package:ditonton_flutter/presentation/pages/movies/movie_detail_page.dart';
import 'package:ditonton_flutter/presentation/pages/movies/popular_movies_page.dart';
import 'package:ditonton_flutter/presentation/pages/movies/search_movie_page.dart';
import 'package:ditonton_flutter/presentation/pages/movies/top_rated_movies_page.dart';
import 'package:ditonton_flutter/presentation/pages/watchlist_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeMoviePage extends StatefulWidget {
  const HomeMoviePage({super.key});

  @override
  HomeMoviePageState createState() => HomeMoviePageState();
}

class HomeMoviePageState extends State<HomeMoviePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<NowPlayingMoviesBloc>().add(OnNowPlayingMovies());
      context.read<PopularMoviesBloc>().add(OnPopularMovies());
      context.read<TopRatedMoviesBloc>().add(OnTopRatedMovies());
    });
    // Provider.of<MovieListNotifier>(context, listen: false)
    //   ..fetchNowPlayingMovies()
    //   ..fetchPopularMovies()
    //   ..fetchTopRatedMovies());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/circle-g.png'),
              ),
              accountName: Text('Ditonton'),
              accountEmail: Text('ditonton@dicoding.com'),
            ),
            ListTile(
              leading: const Icon(Icons.movie),
              title: const Text('Movies'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.tv),
              title: const Text('TV Series'),
              onTap: () {
                // FirebaseCrashlytics.instance.crash();
                Navigator.pushNamed(context, HomeShowPage.routeName);
              },
            ),
            ListTile(
              leading: const Icon(Icons.save_alt),
              title: const Text('Watchlist'),
              onTap: () {
                Navigator.pushNamed(context, WatchlistPage.routeName);
              },
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, AboutPage.routeName);
              },
              leading: const Icon(Icons.info_outline),
              title: const Text('About'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Ditonton Movies'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchMoviePage.routeName);
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Now Playing',
                style: kHeading6,
              ),
              BlocBuilder<NowPlayingMoviesBloc, NowPlayingMoviesState>(
                builder: (context, state) {
                  if (state is NowPlayingLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is NowPlayingHasData) {
                    final result = state.result;
                    return MovieList(result);
                    //   ListView.builder(
                    //   itemBuilder: (context, index) {
                    //     final movie = result[index];
                    //     return MovieCard(movie);
                    //   },
                    //   itemCount: result.length,
                    // );
                  } else if (state is NowPlayingError) {
                    return Center(
                      child: Text(state.message),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              // Consumer<MovieListNotifier>(builder: (context, data, child) {
              //   final state = data.nowPlayingState;
              //   if (state == RequestState.Loading) {
              //     return const Center(
              //       child: CircularProgressIndicator(),
              //     );
              //   } else if (state == RequestState.Loaded) {
              //     return MovieList(data.nowPlayingMovies);
              //   } else {
              //     return const Text('Failed');
              //   }
              // }),
              _buildSubHeading(
                title: 'Popular',
                onTap: () =>
                    Navigator.pushNamed(context, PopularMoviesPage.routeName),
              ),
              BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
                builder: (context, state) {
                  if (state is PopularLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is PopularHasData) {
                    final result = state.result;
                    return MovieList(result);
                    //   ListView.builder(
                    //   itemBuilder: (context, index) {
                    //     final movie = result[index];
                    //     return MovieCard(movie);
                    //   },
                    //   itemCount: result.length,
                    // );
                  } else if (state is PopularError) {
                    return Center(
                      child: Text(state.message),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              // Consumer<MovieListNotifier>(builder: (context, data, child) {
              //   final state = data.popularMoviesState;
              //   if (state == RequestState.Loading) {
              //     return const Center(
              //       child: CircularProgressIndicator(),
              //     );
              //   } else if (state == RequestState.Loaded) {
              //     return MovieList(data.popularMovies);
              //   } else {
              //     return const Text('Failed');
              //   }
              // }),
              _buildSubHeading(
                title: 'Top Rated',
                onTap: () =>
                    Navigator.pushNamed(context, TopRatedMoviesPage.routeName),
              ),
              BlocBuilder<TopRatedMoviesBloc, TopRatedMoviesState>(
                builder: (context, state) {
                  if (state is TopRatedLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is TopRatedHasData) {
                    final result = state.result;
                    return MovieList(result);
                    //   ListView.builder(
                    //   itemBuilder: (context, index) {
                    //     final movie = result[index];
                    //     return MovieCard(movie);
                    //   },
                    //   itemCount: result.length,
                    // );
                  } else if (state is TopRatedError) {
                    return Center(
                      child: Text(state.message),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              // Consumer<MovieListNotifier>(builder: (context, data, child) {
              //   final state = data.topRatedMoviesState;
              //   if (state == RequestState.Loading) {
              //     return const Center(
              //       child: CircularProgressIndicator(),
              //     );
              //   } else if (state == RequestState.Loaded) {
              //     return MovieList(data.topRatedMovies);
              //   } else {
              //     return const Text('Failed');
              //   }
              // }),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildSubHeading({required String title, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kHeading6,
        ),
        InkWell(
          onTap: onTap,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}

class MovieList extends StatelessWidget {
  final List<Movie> movies;

  const MovieList(this.movies, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  MovieDetailPage.routeName,
                  arguments: movie.id,
                );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$baseImageUrl${movie.posterPath}',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: movies.length,
      ),
    );
  }
}
