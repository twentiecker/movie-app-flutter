import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton_flutter/common/constants.dart';
import 'package:ditonton_flutter/domain/entities/genre.dart';
import 'package:ditonton_flutter/domain/entities/shows/show.dart';
import 'package:ditonton_flutter/domain/entities/shows/show_detail.dart';
import 'package:ditonton_flutter/common/state_enum.dart';
import 'package:ditonton_flutter/presentation/bloc/shows/show_detail/show_detail_bloc.dart';
import 'package:ditonton_flutter/presentation/bloc/shows/show_recommendations/show_recommendations_bloc.dart';
import 'package:ditonton_flutter/presentation/bloc/shows/watchlist_show/remove_show/remove_show_bloc.dart';
import 'package:ditonton_flutter/presentation/bloc/shows/watchlist_show/save_show/save_show_bloc.dart';
import 'package:ditonton_flutter/presentation/bloc/shows/watchlist_show/show_status/show_status_bloc.dart';
import 'package:ditonton_flutter/presentation/provider/shows/show_detail_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class ShowDetailPage extends StatefulWidget {
  static const ROUTE_NAME = '/detail-show';

  final int id;

  ShowDetailPage({required this.id});

  @override
  _ShowDetailPageState createState() => _ShowDetailPageState();
}

class _ShowDetailPageState extends State<ShowDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<ShowDetailBloc>().add(OnShowDetail(widget.id));
      context.read<ShowRecommendationsBloc>().add(OnShowRecommendations(widget.id));
      context.read<ShowStatusBloc>().add(OnLoadWatchlistStatus(widget.id));
      // Provider.of<ShowDetailNotifier>(context, listen: false)
      //     .fetchShowDetail(widget.id);
      // Provider.of<ShowDetailNotifier>(context, listen: false)
      //     .loadWatchlistStatus(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ShowDetailBloc, ShowDetailState>(
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
          } else if (state is DetailError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return Container();
          }
        },
      ),
      // Consumer<ShowDetailNotifier>(
      //   builder: (context, provider, child) {
      //     if (provider.showState == RequestState.Loading) {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     } else if (provider.showState == RequestState.Loaded) {
      //       final show = provider.show;
      //       return SafeArea(
      //         child: DetailContent(
      //           show,
      //           provider.showRecommendations,
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
  final ShowDetail show;
  // final List<Show> recommendations;
  // final bool isAddedWatchlist;

  // DetailContent(this.show, this.recommendations, this.isAddedWatchlist);
  DetailContent(this.show);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/w500${show.posterPath}',
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
                              show.name,
                              style: kHeading5,
                            ),
                            BlocBuilder<ShowStatusBloc, ShowStatusState>(
                              builder: (context, state) {
                                if (state is StatusHasData) {
                                  final result = state.result;
                                  return ElevatedButton(
                                    onPressed: () async {
                                      if (!result) {
                                        context.read<SaveShowBloc>().add(OnSaveFromWatchlist(show));
                                        context.read<ShowStatusBloc>().add(OnLoadWatchlistStatus(show.id));
                                        ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text('Added to Watchlist')));
                                      } else {
                                        context.read<RemoveShowBloc>().add(OnRemoveFromWatchlist(show));
                                        context.read<ShowStatusBloc>().add(OnLoadWatchlistStatus(show.id));
                                        ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text('Removed from Watchlist')));
                                      }


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

                                } else {
                                  return Container();
                                }
                              },
                            ),
                            // ElevatedButton(
                            //   onPressed: () async {
                            //     if (!isAddedWatchlist) {
                            //       await Provider.of<ShowDetailNotifier>(context,
                            //               listen: false)
                            //           .addWatchlist(show);
                            //     } else {
                            //       await Provider.of<ShowDetailNotifier>(context,
                            //               listen: false)
                            //           .removeFromWatchlist(show);
                            //     }
                            //
                            //     final message = Provider.of<ShowDetailNotifier>(
                            //             context,
                            //             listen: false)
                            //         .watchlistMessage;
                            //
                            //     if (message ==
                            //             ShowDetailNotifier
                            //                 .watchlistAddSuccessMessage ||
                            //         message ==
                            //             ShowDetailNotifier
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
                              _showGenres(show.genres),
                            ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: show.voteAverage / 2,
                                  itemCount: 5,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: kMikadoYellow,
                                  ),
                                  itemSize: 24,
                                ),
                                Text('${show.voteAverage}')
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Overview',
                              style: kHeading6,
                            ),
                            Text(
                              show.overview,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Recommendations',
                              style: kHeading6,
                            ),
                            BlocBuilder<ShowRecommendationsBloc, ShowRecommendationsState>(
                              builder: (context, state) {
                                if (state is RecommendationsLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (state is RecommendationsHasData) {
                                  final result = state.result;
                                  return Container(
                                    height: 150,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        final show = result[index];
                                        return Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.pushReplacementNamed(
                                                context,
                                                ShowDetailPage.ROUTE_NAME,
                                                arguments: show.id,
                                              );
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                              const BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                'https://image.tmdb.org/t/p/w500${show.posterPath}',
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

                                } else if (state is RecommendationsError) {
                                  return Center(
                                    child: Text(state.message),
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            ),
                            // Consumer<ShowDetailNotifier>(
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
                            //             final show = recommendations[index];
                            //             return Padding(
                            //               padding: const EdgeInsets.all(4.0),
                            //               child: InkWell(
                            //                 onTap: () {
                            //                   Navigator.pushReplacementNamed(
                            //                     context,
                            //                     ShowDetailPage.ROUTE_NAME,
                            //                     arguments: show.id,
                            //                   );
                            //                 },
                            //                 child: ClipRRect(
                            //                   borderRadius:
                            //                       const BorderRadius.all(
                            //                     Radius.circular(8),
                            //                   ),
                            //                   child: CachedNetworkImage(
                            //                     imageUrl:
                            //                         'https://image.tmdb.org/t/p/w500${show.posterPath}',
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
      result += genre.name + ', ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }
}
