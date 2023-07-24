import 'package:ditonton_flutter/data/datasources/db/database_helper.dart';
import 'package:ditonton_flutter/data/datasources/movies/movie_local_data_source.dart';
import 'package:ditonton_flutter/data/datasources/movies/movie_remote_data_source.dart';
import 'package:ditonton_flutter/data/datasources/shows/show_local_data_source.dart';
import 'package:ditonton_flutter/data/datasources/shows/show_remote_data_source.dart';
import 'package:ditonton_flutter/data/repositories/movie_repository_impl.dart';
import 'package:ditonton_flutter/data/repositories/show_repository_impl.dart';
import 'package:ditonton_flutter/domain/repositories/movie_repository.dart';
import 'package:ditonton_flutter/domain/repositories/show_repository.dart';
import 'package:ditonton_flutter/domain/usecases/movies/get_movie_detail.dart';
import 'package:ditonton_flutter/domain/usecases/movies/get_movie_recommendations.dart';
import 'package:ditonton_flutter/domain/usecases/movies/get_now_playing_movies.dart';
import 'package:ditonton_flutter/domain/usecases/movies/get_popular_movies.dart';
import 'package:ditonton_flutter/domain/usecases/movies/get_top_rated_movies.dart';
import 'package:ditonton_flutter/domain/usecases/movies/get_watchlist_movies.dart';
import 'package:ditonton_flutter/domain/usecases/movies/get_watchlist_status.dart';
import 'package:ditonton_flutter/domain/usecases/movies/remove_watchlist.dart';
import 'package:ditonton_flutter/domain/usecases/movies/save_watchlist.dart';
import 'package:ditonton_flutter/domain/usecases/movies/search_movies.dart';
import 'package:ditonton_flutter/domain/usecases/shows/get_airing_today_shows.dart';
import 'package:ditonton_flutter/domain/usecases/shows/get_popular_shows.dart';
import 'package:ditonton_flutter/domain/usecases/shows/get_show_detail.dart';
import 'package:ditonton_flutter/domain/usecases/shows/get_show_recommendations.dart';
import 'package:ditonton_flutter/domain/usecases/shows/get_top_rated_shows.dart';
import 'package:ditonton_flutter/domain/usecases/shows/get_watchlist_show_status.dart';
import 'package:ditonton_flutter/domain/usecases/shows/get_watchlist_shows.dart';
import 'package:ditonton_flutter/domain/usecases/shows/remove_watchlist_show.dart';
import 'package:ditonton_flutter/domain/usecases/shows/save_watchlist_show.dart';
import 'package:ditonton_flutter/domain/usecases/shows/search_shows.dart';
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
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  // provider
  locator.registerFactory(
    () => MovieListNotifier(
      getNowPlayingMovies: locator(),
      getPopularMovies: locator(),
      getTopRatedMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => ShowListNotifier(
      getAiringTodayShows: locator(),
      getPopularShows: locator(),
      getTopRatedShows: locator(),
    ),
  );
  locator.registerFactory(
    () => MovieDetailNotifier(
      getMovieDetail: locator(),
      getMovieRecommendations: locator(),
      getWatchListStatus: locator(),
      saveWatchlist: locator(),
      removeWatchlist: locator(),
    ),
  );
  locator.registerFactory(
    () => ShowDetailNotifier(
      getShowDetail: locator(),
      getShowRecommendations: locator(),
      getWatchListShowStatus: locator(),
      saveWatchlist: locator(),
      removeWatchlist: locator(),
    ),
  );
  locator.registerFactory(
    () => MovieSearchNotifier(
      searchMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => ShowSearchNotifier(
      searchShows: locator(),
    ),
  );
  locator.registerFactory(
    () => PopularMoviesNotifier(
      locator(),
    ),
  );
  locator.registerFactory(
    () => PopularShowsNotifier(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TopRatedMoviesNotifier(
      getTopRatedMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => TopRatedShowsNotifier(
      getTopRatedShows: locator(),
    ),
  );
  locator.registerFactory(
    () => WatchlistMovieNotifier(
      getWatchlistMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => WatchlistShowNotifier(
      getWatchlistShows: locator(),
    ),
  );

  // use case
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => GetWatchListStatus(locator()));
  locator.registerLazySingleton(() => SaveWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveWatchlist(locator()));
  locator.registerLazySingleton(() => GetWatchlistMovies(locator()));
  locator.registerLazySingleton(() => GetAiringTodayShows(locator()));
  locator.registerLazySingleton(() => GetPopularShows(locator()));
  locator.registerLazySingleton(() => GetTopRatedShows(locator()));
  locator.registerLazySingleton(() => GetShowDetail(locator()));
  locator.registerLazySingleton(() => GetShowRecommendations(locator()));
  locator.registerLazySingleton(() => SearchShows(locator()));
  locator.registerLazySingleton(() => GetWatchListShowStatus(locator()));
  locator.registerLazySingleton(() => SaveWatchlistShow(locator()));
  locator.registerLazySingleton(() => RemoveWatchlistShow(locator()));
  locator.registerLazySingleton(() => GetWatchlistShows(locator()));

  // repository
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<ShowRepository>(
    () => ShowRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  // data sources
  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl(databaseHelper: locator()));
  locator.registerLazySingleton<ShowRemoteDataSource>(
      () => ShowRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<ShowLocalDataSource>(
      () => ShowLocalDataSourceImpl(databaseHelper: locator()));

  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  // external
  locator.registerLazySingleton(() => http.Client());
}
