import 'package:ditonton_flutter/common/constants.dart';
import 'package:ditonton_flutter/presentation/bloc/shows/show_search/show_search_bloc.dart';
import 'package:ditonton_flutter/presentation/widgets/show_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchShowsPage extends StatelessWidget {
  static const routeName = '/search-shows';

  const SearchShowsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Shows'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (query) {
                context.read<ShowSearchBloc>().add(OnQueryChanged(query));
              },
              // onSubmitted: (query) {
              //   Provider.of<ShowSearchNotifier>(context, listen: false)
              //       .fetchShowSearch(query);
              // },
              decoration: const InputDecoration(
                hintText: 'Search title',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.search,
            ),
            const SizedBox(height: 16),
            Text(
              'Search Result',
              style: kHeading6,
            ),
            BlocBuilder<ShowSearchBloc, ShowSearchState>(
              builder: (context, state) {
                if (state is SearchLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is SearchHasData) {
                  final result = state.result;
                  return Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemBuilder: (context, index) {
                        final show = result[index];
                        return ShowCard(show);
                      },
                      itemCount: result.length,
                    ),
                  );
                } else if (state is SearchError) {
                  return Expanded(
                    child: Center(
                      child: Text(state.message),
                    ),
                  );
                } else {
                  return Expanded(
                    child: Container(),
                  );
                }
              },
            ),
            // Consumer<ShowSearchNotifier>(
            //   builder: (context, data, child) {
            //     if (data.state == RequestState.Loading) {
            //       return const Center(
            //         child: CircularProgressIndicator(),
            //       );
            //     } else if (data.state == RequestState.Loaded) {
            //       final result = data.searchResult;
            //       return Expanded(
            //         child: ListView.builder(
            //           padding: const EdgeInsets.all(8),
            //           itemBuilder: (context, index) {
            //             final show = data.searchResult[index];
            //             return ShowCard(show);
            //           },
            //           itemCount: result.length,
            //         ),
            //       );
            //     } else {
            //       return Expanded(
            //         child: Container(),
            //       );
            //     }
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
