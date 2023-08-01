import 'package:ditonton_flutter/presentation/bloc/movies/movie_detail/movie_detail_bloc.dart';
import 'package:ditonton_flutter/presentation/bloc/movies/movie_recommendations/movie_recommendations_bloc.dart';
import 'package:ditonton_flutter/presentation/bloc/movies/movie_search/movie_search_bloc.dart';
import 'package:ditonton_flutter/presentation/bloc/movies/now_playing_movies/now_playing_movies_bloc.dart';
import 'package:ditonton_flutter/presentation/bloc/movies/popular_movies/popular_movies_bloc.dart';
import 'package:ditonton_flutter/presentation/bloc/movies/top_rated_movies/top_rated_movies_bloc.dart';
import 'package:ditonton_flutter/presentation/bloc/movies/watchlist_movie/movie_list/movie_list_bloc.dart';
import 'package:ditonton_flutter/presentation/bloc/movies/watchlist_movie/remove_movie/remove_movie_bloc.dart';
import 'package:ditonton_flutter/presentation/bloc/movies/watchlist_movie/save_movie/save_movie_bloc.dart';
import 'package:ditonton_flutter/presentation/bloc/shows/airing_today_shows/airing_today_shows_bloc.dart';
import 'package:ditonton_flutter/presentation/bloc/shows/popular_shows/popular_shows_bloc.dart';
import 'package:ditonton_flutter/presentation/bloc/shows/show_detail/show_detail_bloc.dart';
import 'package:ditonton_flutter/presentation/bloc/shows/show_recommendations/show_recommendations_bloc.dart';
import 'package:ditonton_flutter/presentation/bloc/shows/show_search/show_search_bloc.dart';
import 'package:ditonton_flutter/presentation/bloc/movies/watchlist_movie/movie_status/movie_status_bloc.dart';
import 'package:ditonton_flutter/presentation/bloc/shows/top_rated_shows/top_rated_shows_bloc.dart';
import 'package:ditonton_flutter/presentation/bloc/shows/watchlist_show/remove_show/remove_show_bloc.dart';
import 'package:ditonton_flutter/presentation/bloc/shows/watchlist_show/save_show/save_show_bloc.dart';
import 'package:ditonton_flutter/presentation/bloc/shows/watchlist_show/show_list/show_list_bloc.dart';
import 'package:ditonton_flutter/presentation/bloc/shows/watchlist_show/show_status/show_status_bloc.dart';
import 'package:ditonton_flutter/presentation/pages/about_page.dart';
import 'package:ditonton_flutter/presentation/pages/movies/home_movie_page.dart';
import 'package:ditonton_flutter/presentation/pages/shows/home_show_page.dart';
import 'package:ditonton_flutter/presentation/pages/movies/movie_detail_page.dart';
import 'package:ditonton_flutter/presentation/pages/movies/popular_movies_page.dart';
import 'package:ditonton_flutter/presentation/pages/movies/search_movie_page.dart';
import 'package:ditonton_flutter/presentation/pages/shows/popular_shows_page.dart';
import 'package:ditonton_flutter/presentation/pages/shows/search_shows_page.dart';
import 'package:ditonton_flutter/presentation/pages/shows/show_detail_page.dart';
import 'package:ditonton_flutter/presentation/pages/shows/top_rated_shows_page.dart';
import 'package:ditonton_flutter/presentation/pages/movies/top_rated_movies_page.dart';
import 'package:ditonton_flutter/presentation/pages/watchlist_page.dart';
import 'package:ditonton_flutter/presentation/provider/movies/movie_detail_notifier.dart';
import 'package:ditonton_flutter/presentation/provider/movies/movie_list_notifier.dart';
import 'package:ditonton_flutter/presentation/provider/movies/movie_search_notifier.dart';
import 'package:ditonton_flutter/presentation/provider/movies/popular_movies_notifier.dart';
import 'package:ditonton_flutter/presentation/provider/shows/popular_shows_notifier.dart';
import 'package:ditonton_flutter/presentation/provider/shows/show_detail_notifier.dart';
import 'package:ditonton_flutter/presentation/provider/shows/show_list_notifier.dart';
import 'package:ditonton_flutter/presentation/provider/shows/show_search_notifier.dart';
import 'package:ditonton_flutter/presentation/provider/shows/top_rated_shows_notifier.dart';
import 'package:ditonton_flutter/presentation/provider/shows/watchlist_show_notifier.dart';
import 'package:ditonton_flutter/presentation/provider/movies/top_rated_movies_notifier.dart';
import 'package:ditonton_flutter/presentation/provider/movies/watchlist_movie_notifier.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ditonton_flutter/injection.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'common/constants.dart';
import 'common/utils.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => di.locator<MovieListNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<MovieDetailNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<MovieSearchNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TopRatedMoviesNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<PopularMoviesNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<WatchlistMovieNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<ShowListNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<ShowDetailNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<ShowSearchNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TopRatedShowsNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<PopularShowsNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<WatchlistShowNotifier>(),
        ),
        BlocProvider(
          create: (_) => di.locator<MovieSearchBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<MovieDetailBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<MovieRecommendationsBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<NowPlayingMoviesBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<PopularMoviesBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TopRatedMoviesBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<SaveMovieBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<RemoveMovieBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<MovieStatusBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<MovieListBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<ShowSearchBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<ShowDetailBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<ShowRecommendationsBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<AiringTodayShowsBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<PopularShowsBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TopRatedShowsBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<SaveShowBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<RemoveShowBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<ShowStatusBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<ShowListBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          colorScheme: kColorScheme,
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme,
        ),
        home: const HomeMoviePage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/home':
              return MaterialPageRoute(builder: (_) => const HomeMoviePage());
            case PopularMoviesPage.routeName:
              return CupertinoPageRoute(
                  builder: (_) => const PopularMoviesPage());
            case TopRatedMoviesPage.routeName:
              return CupertinoPageRoute(
                  builder: (_) => const TopRatedMoviesPage());
            case MovieDetailPage.routeName:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => MovieDetailPage(id: id),
                settings: settings,
              );
            case SearchMoviePage.routeName:
              return CupertinoPageRoute(
                  builder: (_) => const SearchMoviePage());
            case AboutPage.routeName:
              return MaterialPageRoute(builder: (_) => const AboutPage());
            case HomeShowPage.routeName:
              return MaterialPageRoute(builder: (_) => const HomeShowPage());
            case PopularShowsPage.routeName:
              return CupertinoPageRoute(
                  builder: (_) => const PopularShowsPage());
            case TopRatedShowsPage.routeName:
              return CupertinoPageRoute(
                  builder: (_) => const TopRatedShowsPage());
            case ShowDetailPage.routeName:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => ShowDetailPage(id: id),
                settings: settings,
              );
            case SearchShowsPage.routeName:
              return CupertinoPageRoute(
                  builder: (_) => const SearchShowsPage());
            case WatchlistPage.routeName:
              return MaterialPageRoute(builder: (_) => const WatchlistPage());
            default:
              return MaterialPageRoute(builder: (_) {
                return const Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
