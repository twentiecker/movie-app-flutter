import 'package:ditonton_flutter/presentation/bloc/shows/popular_shows/popular_shows_bloc.dart';
import 'package:ditonton_flutter/presentation/widgets/show_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularShowsPage extends StatefulWidget {
  static const routeName = '/popular-show';

  const PopularShowsPage({super.key});

  @override
  PopularShowsPageState createState() => PopularShowsPageState();
}

class PopularShowsPageState extends State<PopularShowsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => context.read<PopularShowsBloc>().add(OnPopularShows()));
    // Provider.of<PopularShowsNotifier>(context, listen: false)
    //     .fetchPopularShows());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Shows'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<PopularShowsBloc, PopularShowsState>(
          builder: (context, state) {
            if (state is PopularLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PopularHasData) {
              final result = state.result;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final show = result[index];
                  return ShowCard(show);
                },
                itemCount: result.length,
              );
            } else if (state is PopularError) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return Container();
            }
          },
        ),
        // Consumer<PopularShowsNotifier>(
        //   builder: (context, data, child) {
        //     if (data.state == RequestState.Loading) {
        //       return const Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     } else if (data.state == RequestState.Loaded) {
        //       return ListView.builder(
        //         itemBuilder: (context, index) {
        //           final show = data.shows[index];
        //           return ShowCard(show);
        //         },
        //         itemCount: data.shows.length,
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
