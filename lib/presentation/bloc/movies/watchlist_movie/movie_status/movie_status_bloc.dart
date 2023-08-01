import 'package:bloc/bloc.dart';
import 'package:ditonton_flutter/domain/entities/movies/movie.dart';
import 'package:ditonton_flutter/domain/entities/movies/movie_detail.dart';
import 'package:ditonton_flutter/domain/usecases/movies/get_movie_detail.dart';
import 'package:ditonton_flutter/domain/usecases/movies/get_movie_recommendations.dart';
import 'package:ditonton_flutter/domain/usecases/movies/get_watchlist_movie_status.dart';
import 'package:ditonton_flutter/presentation/bloc/movies/movie_recommendations/movie_recommendations_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

part '../movie_status/movie_status_event.dart';

part '../movie_status/movie_status_state.dart';

class MovieStatusBloc extends Bloc<MovieStatusEvent, MovieStatusState> {
  final GetWatchListMovieStatus _getWatchListMovieStatus;

  MovieStatusBloc(this._getWatchListMovieStatus) : super(StatusEmpty()) {
    on<OnLoadWatchlistStatus>((event, emit) async {
      final id = event.id;

      final result = await _getWatchListMovieStatus.execute(id);
      emit(StatusHasData(result));
    });
  }
}
