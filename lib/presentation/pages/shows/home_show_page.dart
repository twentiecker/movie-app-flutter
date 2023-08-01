import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton_flutter/common/constants.dart';
import 'package:ditonton_flutter/domain/entities/shows/show.dart';
import 'package:ditonton_flutter/presentation/bloc/shows/airing_today_shows/airing_today_shows_bloc.dart';
import 'package:ditonton_flutter/presentation/bloc/shows/popular_shows/popular_shows_bloc.dart';
import 'package:ditonton_flutter/presentation/bloc/shows/top_rated_shows/top_rated_shows_bloc.dart';
import 'package:ditonton_flutter/presentation/pages/shows/popular_shows_page.dart';
import 'package:ditonton_flutter/presentation/pages/shows/search_shows_page.dart';
import 'package:ditonton_flutter/presentation/pages/shows/show_detail_page.dart';
import 'package:ditonton_flutter/presentation/pages/shows/top_rated_shows_page.dart';
import 'package:ditonton_flutter/common/state_enum.dart';
import 'package:ditonton_flutter/presentation/provider/shows/show_list_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class HomeShowPage extends StatefulWidget {
  static const ROUTE_NAME = '/show';

  @override
  _HomeShowPageState createState() => _HomeShowPageState();
}

class _HomeShowPageState extends State<HomeShowPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<AiringTodayShowsBloc>().add(OnAiringTodayShows());
      context.read<PopularShowsBloc>().add(OnPopularShows());
      context.read<TopRatedShowsBloc>().add(OnTopRatedShows());
    });
    // Future.microtask(() => Provider.of<ShowListNotifier>(context, listen: false)
    //   ..fetchAiringTodayShows()
    //   ..fetchPopularShows()
    //   ..fetchTopRatedShows());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ditonton TV Series'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchShowsPage.ROUTE_NAME);
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
                'Airing Today',
                style: kHeading6,
              ),
              BlocBuilder<AiringTodayShowsBloc, AiringTodayShowsState>(
                builder: (context, state) {
                  if (state is AiringTodayLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is AiringTodayHasData) {
                    final result = state.result;
                    return ShowList(result);
                  } else if (state is AiringTodayError) {
                    return Center(
                      child: Text(state.message),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              // Consumer<ShowListNotifier>(builder: (context, data, child) {
              //   final state = data.airingTodayState;
              //   if (state == RequestState.Loading) {
              //     return const Center(
              //       child: CircularProgressIndicator(),
              //     );
              //   } else if (state == RequestState.Loaded) {
              //     return ShowList(data.airingTodayShows);
              //   } else {
              //     return const Text('Failed');
              //   }
              // }),
              _buildSubHeading(
                title: 'Popular',
                onTap: () =>
                    Navigator.pushNamed(context, PopularShowsPage.ROUTE_NAME),
              ),
              BlocBuilder<PopularShowsBloc, PopularShowsState>(
                builder: (context, state) {
                  if (state is PopularLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is PopularHasData) {
                    final result = state.result;
                    return ShowList(result);
                  } else if (state is PopularError) {
                    return Center(
                      child: Text(state.message),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              // Consumer<ShowListNotifier>(builder: (context, data, child) {
              //   final state = data.popularShowsState;
              //   if (state == RequestState.Loading) {
              //     return const Center(
              //       child: CircularProgressIndicator(),
              //     );
              //   } else if (state == RequestState.Loaded) {
              //     return ShowList(data.popularShows);
              //   } else {
              //     return const Text('Failed');
              //   }
              // }),
              _buildSubHeading(
                title: 'Top Rated',
                onTap: () =>
                    Navigator.pushNamed(context, TopRatedShowsPage.ROUTE_NAME),
              ),
              BlocBuilder<TopRatedShowsBloc, TopRatedShowsState>(
                builder: (context, state) {
                  if (state is TopRatedLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is TopRatedHasData) {
                    final result = state.result;
                    return ShowList(result);
                  } else if (state is TopRatedError) {
                    return Center(
                      child: Text(state.message),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              // Consumer<ShowListNotifier>(builder: (context, data, child) {
              //   final state = data.topRatedShowsState;
              //   if (state == RequestState.Loading) {
              //     return const Center(
              //       child: CircularProgressIndicator(),
              //     );
              //   } else if (state == RequestState.Loaded) {
              //     return ShowList(data.topRatedShows);
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

class ShowList extends StatelessWidget {
  final List<Show> shows;

  ShowList(this.shows);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final show = shows[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  ShowDetailPage.ROUTE_NAME,
                  arguments: show.id,
                );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${show.posterPath}',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: shows.length,
      ),
    );
  }
}
