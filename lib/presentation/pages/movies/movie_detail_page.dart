import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton_flutter/common/constants.dart';
import 'package:ditonton_flutter/domain/entities/genre.dart';
import 'package:ditonton_flutter/domain/entities/movies/movie_detail.dart';
import 'package:ditonton_flutter/presentation/bloc/movies/movie_detail/movie_detail_bloc.dart';
import 'package:ditonton_flutter/presentation/bloc/movies/movie_recommendations/movie_recommendations_bloc.dart';
import 'package:ditonton_flutter/presentation/bloc/movies/watchlist_movie/movie_status/movie_status_bloc.dart';
import 'package:ditonton_flutter/presentation/bloc/movies/watchlist_movie/remove_movie/remove_movie_bloc.dart';
import 'package:ditonton_flutter/presentation/bloc/movies/watchlist_movie/save_movie/save_movie_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieDetailPage extends StatefulWidget {
  static const routeName = '/detail';

  final int id;

  const MovieDetailPage({super.key, required this.id});

  @override
  MovieDetailPageState createState() => MovieDetailPageState();
}

class MovieDetailPageState extends State<MovieDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<MovieDetailBloc>().add(OnMovieDetail(widget.id));
      context
          .read<MovieRecommendationsBloc>()
          .add(OnMovieRecommendations(widget.id));
      context.read<MovieStatusBloc>().add(OnLoadWatchlistStatus(widget.id));
      // Provider.of<MovieDetailNotifier>(context, listen: false)
      //     .fetchMovieDetail(widget.id);
      // Provider.of<MovieDetailNotifier>(context, listen: false)
      //     .loadWatchlistStatus(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieDetailBloc, MovieDetailState>(
        builder: (context, state) {
          if (state is DetailLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is DetailHasData) {
            final result = state.result;
            return SafeArea(
              child: DetailContent(result),
            );
            //   ListView.builder(
            //   itemBuilder: (context, index) {
            //     final movie = result[index];
            //     return MovieCard(movie);
            //   },
            //   itemCount: result.length,
            // );
          } else if (state is DetailError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return Container();
          }
        },
      ),
      // Consumer<MovieDetailNotifier>(
      //   builder: (context, provider, child) {
      //     if (provider.movieState == RequestState.Loading) {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     } else if (provider.movieState == RequestState.Loaded) {
      //       final movie = provider.movie;
      //       return SafeArea(
      //         child: DetailContent(
      //           movie,
      //           provider.movieRecommendations,
      //           provider.isAddedToWatchlist,
      //         ),
      //       );
      //     } else {
      //       return Text(provider.message);
      //     }
      //   },
      // ),
    );
  }
}

class DetailContent extends StatelessWidget {
  final MovieDetail movie;

  // final List<Movie> recommendations;
  // final bool isAddedWatchlist;

  // DetailContent(this.movie, this.recommendations, this.isAddedWatchlist);
  const DetailContent(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
          width: screenWidth,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        Container(
          margin: const EdgeInsets.only(top: 48 + 8),
          child: DraggableScrollableSheet(
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: kRichBlack,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  right: 16,
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie.title,
                              style: kHeading5,
                            ),
                            BlocBuilder<MovieStatusBloc, MovieStatusState>(
                              builder: (context, state) {
                                if (state is StatusHasData) {
                                  final result = state.result;
                                  return ElevatedButton(
                                    onPressed: () async {
                                      if (!result) {
                                        // await Provider.of<MovieDetailNotifier>(
                                        //     context,
                                        //     listen: false)
                                        //     .addWatchlist(movie);
                                        context
                                            .read<SaveMovieBloc>()
                                            .add(OnSaveFromWatchlist(movie));
                                        context.read<MovieStatusBloc>().add(
                                            OnLoadWatchlistStatus(movie.id));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text(
                                                    'Added to Watchlist')));
                                      } else {
                                        // await Provider.of<MovieDetailNotifier>(
                                        //     context,
                                        //     listen: false)
                                        //     .removeFromWatchlist(movie);
                                        context
                                            .read<RemoveMovieBloc>()
                                            .add(OnRemoveFromWatchlist(movie));
                                        context.read<MovieStatusBloc>().add(
                                            OnLoadWatchlistStatus(movie.id));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text(
                                                    'Removed from Watchlist')));
                                      }

                                      // final message =
                                      //     Provider.of<MovieDetailNotifier>(context,
                                      //         listen: false)
                                      //         .watchlistMessage;

                                      // if (message ==
                                      //     MovieDetailNotifier
                                      //         .watchlistAddSuccessMessage ||
                                      //     message ==
                                      //         MovieDetailNotifier
                                      //             .watchlistRemoveSuccessMessage) {
                                      //   ScaffoldMessenger.of(context).showSnackBar(
                                      //       SnackBar(content: Text(message)));
                                      // } else {
                                      //   showDialog(
                                      //       context: context,
                                      //       builder: (context) {
                                      //         return AlertDialog(
                                      //           content: Text(message),
                                      //         );
                                      //       });
                                      // }
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        result
                                            ? const Icon(Icons.check)
                                            : const Icon(Icons.add),
                                        const Text('Watchlist'),
                                      ],
                                    ),
                                  );
                                  //   ListView.builder(
                                  //   itemBuilder: (context, index) {
                                  //     final movie = result[index];
                                  //     return MovieCard(movie);
                                  //   },
                                  //   itemCount: result.length,
                                  // );
                                } else {
                                  return Container();
                                }
                              },
                            ),
                            // ElevatedButton(
                            //   onPressed: () async {
                            //     if (!isAddedWatchlist) {
                            //       await Provider.of<MovieDetailNotifier>(
                            //               context,
                            //               listen: false)
                            //           .addWatchlist(movie);
                            //     } else {
                            //       await Provider.of<MovieDetailNotifier>(
                            //               context,
                            //               listen: false)
                            //           .removeFromWatchlist(movie);
                            //     }
                            //
                            //     final message =
                            //         Provider.of<MovieDetailNotifier>(context,
                            //                 listen: false)
                            //             .watchlistMessage;
                            //
                            //     if (message ==
                            //             MovieDetailNotifier
                            //                 .watchlistAddSuccessMessage ||
                            //         message ==
                            //             MovieDetailNotifier
                            //                 .watchlistRemoveSuccessMessage) {
                            //       ScaffoldMessenger.of(context).showSnackBar(
                            //           SnackBar(content: Text(message)));
                            //     } else {
                            //       showDialog(
                            //           context: context,
                            //           builder: (context) {
                            //             return AlertDialog(
                            //               content: Text(message),
                            //             );
                            //           });
                            //     }
                            //   },
                            //   child: Row(
                            //     mainAxisSize: MainAxisSize.min,
                            //     children: [
                            //       isAddedWatchlist
                            //           ? const Icon(Icons.check)
                            //           : const Icon(Icons.add),
                            //       const Text('Watchlist'),
                            //     ],
                            //   ),
                            // ),
                            Text(
                              _showGenres(movie.genres),
                            ),
                            Text(
                              _showDuration(movie.runtime),
                            ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: movie.voteAverage / 2,
                                  itemCount: 5,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: kMikadoYellow,
                                  ),
                                  itemSize: 24,
                                ),
                                Text('${movie.voteAverage}')
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Overview',
                              style: kHeading6,
                            ),
                            Text(
                              movie.overview,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Recommendations',
                              style: kHeading6,
                            ),
                            BlocBuilder<MovieRecommendationsBloc,
                                MovieRecommendationsState>(
                              builder: (context, state) {
                                if (state is RecommendationsLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (state is RecommendationsHasData) {
                                  final result = state.result;
                                  return SizedBox(
                                    height: 150,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        final movie = result[index];
                                        return Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.pushReplacementNamed(
                                                context,
                                                MovieDetailPage.routeName,
                                                arguments: movie.id,
                                              );
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                                                placeholder: (context, url) =>
                                                    const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(Icons.error),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount: result.length,
                                    ),
                                  );
                                  //   ListView.builder(
                                  //   itemBuilder: (context, index) {
                                  //     final movie = result[index];
                                  //     return MovieCard(movie);
                                  //   },
                                  //   itemCount: result.length,
                                  // );
                                } else if (state is RecommendationsError) {
                                  return Center(
                                    child: Text(state.message),
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            ),
                            // Consumer<MovieDetailNotifier>(
                            //   builder: (context, data, child) {
                            //     if (data.recommendationState ==
                            //         RequestState.Loading) {
                            //       return const Center(
                            //         child: CircularProgressIndicator(),
                            //       );
                            //     } else if (data.recommendationState ==
                            //         RequestState.Error) {
                            //       return Text(data.message);
                            //     } else if (data.recommendationState ==
                            //         RequestState.Loaded) {
                            //       return Container(
                            //         height: 150,
                            //         child: ListView.builder(
                            //           scrollDirection: Axis.horizontal,
                            //           itemBuilder: (context, index) {
                            //             final movie = recommendations[index];
                            //             return Padding(
                            //               padding: const EdgeInsets.all(4.0),
                            //               child: InkWell(
                            //                 onTap: () {
                            //                   Navigator.pushReplacementNamed(
                            //                     context,
                            //                     MovieDetailPage.ROUTE_NAME,
                            //                     arguments: movie.id,
                            //                   );
                            //                 },
                            //                 child: ClipRRect(
                            //                   borderRadius:
                            //                       const BorderRadius.all(
                            //                     Radius.circular(8),
                            //                   ),
                            //                   child: CachedNetworkImage(
                            //                     imageUrl:
                            //                         'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                            //                     placeholder: (context, url) =>
                            //                         const Center(
                            //                       child:
                            //                           CircularProgressIndicator(),
                            //                     ),
                            //                     errorWidget:
                            //                         (context, url, error) =>
                            //                             const Icon(Icons.error),
                            //                   ),
                            //                 ),
                            //               ),
                            //             );
                            //           },
                            //           itemCount: recommendations.length,
                            //         ),
                            //       );
                            //     } else {
                            //       return Container();
                            //     }
                            //   },
                            // ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        color: Colors.white,
                        height: 4,
                        width: 48,
                      ),
                    ),
                  ],
                ),
              );
            },
            minChildSize: 0.25,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: kRichBlack,
            foregroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        )
      ],
    );
  }

  String _showGenres(List<Genre> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }
}
