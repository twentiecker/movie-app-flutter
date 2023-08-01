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
import 'package:ditonton_flutter/domain/usecases/movies/get_watchlist_movie_status.dart';
import 'package:ditonton_flutter/domain/usecases/movies/remove_watchlist_movie.dart';
import 'package:ditonton_flutter/domain/usecases/movies/save_watchlist_movie.dart';
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
import 'package:get_it/get_it.dart';
import 'package:http/io_client.dart';

import 'common/ssl_pinning.dart';

final locator = GetIt.instance;

Future<void> init() async {
  IOClient ioClient = await SslPinning.ioClient;

  // bloc
  locator.registerFactory(
    () => MovieSearchBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => MovieDetailBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => MovieRecommendationsBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => NowPlayingMoviesBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => PopularMoviesBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TopRatedMoviesBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => SaveMovieBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => RemoveMovieBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => MovieStatusBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => MovieListBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => ShowSearchBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => ShowDetailBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => ShowRecommendationsBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => AiringTodayShowsBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => PopularShowsBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TopRatedShowsBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => SaveShowBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => RemoveShowBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => ShowStatusBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => ShowListBloc(
      locator(),
    ),
  );

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
  locator.registerLazySingleton(() => GetWatchListMovieStatus(locator()));
  locator.registerLazySingleton(() => SaveWatchlistMovie(locator()));
  locator.registerLazySingleton(() => RemoveWatchlistMovie(locator()));
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
  // locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton<IOClient>(() => ioClient);
}
