import 'package:ditonton_flutter/presentation/bloc/shows/top_rated_shows/top_rated_shows_bloc.dart';
import 'package:ditonton_flutter/presentation/widgets/show_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopRatedShowsPage extends StatefulWidget {
  static const routeName = '/top-rated-show';

  const TopRatedShowsPage({super.key});

  @override
  TopRatedShowsPageState createState() => TopRatedShowsPageState();
}

class TopRatedShowsPageState extends State<TopRatedShowsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => context.read<TopRatedShowsBloc>().add(OnTopRatedShows()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Rated Shows'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TopRatedShowsBloc, TopRatedShowsState>(
          builder: (context, state) {
            if (state is TopRatedLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TopRatedHasData) {
              final result = state.result;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final show = result[index];
                  return ShowCard(show);
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
      ),
    );
  }
}
