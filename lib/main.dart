import 'package:ditonton_flutter/presentation/pages/about_page.dart';
import 'package:ditonton_flutter/presentation/pages/movies/home_movie_page.dart';
import 'package:ditonton_flutter/presentation/pages/shows/home_show_page.dart';
import 'package:ditonton_flutter/presentation/pages/movies/movie_detail_page.dart';
import 'package:ditonton_flutter/presentation/pages/movies/popular_movies_page.dart';
import 'package:ditonton_flutter/presentation/pages/movies/search_page.dart';
import 'package:ditonton_flutter/presentation/pages/shows/popular_shows_page.dart';
import 'package:ditonton_flutter/presentation/pages/shows/search_shows_page.dart';
import 'package:ditonton_flutter/presentation/pages/shows/show_detail_page.dart';
import 'package:ditonton_flutter/presentation/pages/shows/top_rated_shows_page.dart';
import 'package:ditonton_flutter/presentation/pages/shows/watchlist_shows_page.dart';
import 'package:ditonton_flutter/presentation/pages/movies/top_rated_movies_page.dart';
import 'package:ditonton_flutter/presentation/pages/movies/watchlist_movies_page.dart';
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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ditonton_flutter/injection.dart' as di;
import 'package:provider/provider.dart';

import 'common/constants.dart';
import 'common/utils.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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

        /// shows
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
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          colorScheme: kColorScheme,
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme,
        ),
        home: HomeMoviePage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            /// movies
            case '/home':
              return MaterialPageRoute(builder: (_) => HomeMoviePage());
            case PopularMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => PopularMoviesPage());
            case TopRatedMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => TopRatedMoviesPage());
            case MovieDetailPage.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => MovieDetailPage(id: id),
                settings: settings,
              );
            case SearchPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => SearchPage());
            // case WatchlistMoviesPage.ROUTE_NAME:
            //   return MaterialPageRoute(builder: (_) => WatchlistMoviesPage());
            case AboutPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => AboutPage());

            /// shows
            case HomeShowPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => HomeShowPage());
            case PopularShowsPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => PopularShowsPage());
            case TopRatedShowsPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => TopRatedShowsPage());
            case ShowDetailPage.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => ShowDetailPage(id: id),
                settings: settings,
              );
            case SearchShowsPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => SearchShowsPage());
            // case WatchlistShowsPage.ROUTE_NAME:
            //   return MaterialPageRoute(builder: (_) => WatchlistShowsPage());
            case WatchlistPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => WatchlistPage());
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
