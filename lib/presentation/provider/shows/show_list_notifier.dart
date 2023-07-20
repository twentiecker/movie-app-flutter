import 'package:ditonton_flutter/domain/entities/movies/movie.dart';
import 'package:ditonton_flutter/domain/entities/shows/show.dart';
import 'package:ditonton_flutter/common/state_enum.dart';
import 'package:ditonton_flutter/domain/usecases/shows/get_airing_today_shows.dart';
import 'package:ditonton_flutter/domain/usecases/shows/get_popular_shows.dart';
import 'package:ditonton_flutter/domain/usecases/shows/get_top_rated_shows.dart';
import 'package:flutter/material.dart';

class ShowListNotifier extends ChangeNotifier {
  var _airingTodayShows = <Show>[];

  List<Show> get airingTodayShows => _airingTodayShows;

  RequestState _airingTodayState = RequestState.Empty;

  RequestState get airingTodayState => _airingTodayState;

  var _popularShows = <Show>[];

  List<Show> get popularShows => _popularShows;

  RequestState _popularShowsState = RequestState.Empty;

  RequestState get popularShowsState => _popularShowsState;

  var _topRatedShows = <Show>[];

  List<Show> get topRatedShows => _topRatedShows;

  RequestState _topRatedShowsState = RequestState.Empty;

  RequestState get topRatedShowsState => _topRatedShowsState;

  String _message = '';

  String get message => _message;

  ShowListNotifier({
    required this.getAiringTodayShows,
    required this.getPopularShows,
    required this.getTopRatedShows,
  });

  final GetAiringTodayShows getAiringTodayShows;
  final GetPopularShows getPopularShows;
  final GetTopRatedShows getTopRatedShows;

  Future<void> fetchAiringTodayShows() async {
    _airingTodayState = RequestState.Loading;
    notifyListeners();

    final result = await getAiringTodayShows.execute();
    result.fold(
      (failure) {
        _airingTodayState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (showsData) {
        _airingTodayState = RequestState.Loaded;
        _airingTodayShows = showsData;
        notifyListeners();
      },
    );
  }

  Future<void> fetchPopularShows() async {
    _popularShowsState = RequestState.Loading;
    notifyListeners();

    final result = await getPopularShows.execute();
    result.fold(
      (failure) {
        _popularShowsState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (showsData) {
        _popularShowsState = RequestState.Loaded;
        _popularShows = showsData;
        notifyListeners();
      },
    );
  }

  Future<void> fetchTopRatedShows() async {
    _topRatedShowsState = RequestState.Loading;
    notifyListeners();

    final result = await getTopRatedShows.execute();
    result.fold(
      (failure) {
        _topRatedShowsState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (showsData) {
        _topRatedShowsState = RequestState.Loaded;
        _topRatedShows = showsData;
        notifyListeners();
      },
    );
  }
}
