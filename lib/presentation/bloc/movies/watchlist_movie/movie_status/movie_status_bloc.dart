import 'package:ditonton_flutter/domain/usecases/movies/get_watchlist_movie_status.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
