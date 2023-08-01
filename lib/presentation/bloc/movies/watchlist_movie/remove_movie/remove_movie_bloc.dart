import 'package:ditonton_flutter/domain/entities/movies/movie_detail.dart';
import 'package:ditonton_flutter/domain/usecases/movies/remove_watchlist_movie.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../remove_movie/remove_movie_event.dart';

part '../remove_movie/remove_movie_state.dart';

class RemoveMovieBloc extends Bloc<RemoveMovieEvent, RemoveMovieState> {
  final RemoveWatchlistMovie _removeWatchlistMovie;

  RemoveMovieBloc(this._removeWatchlistMovie) : super(RemoveEmpty()) {
    on<OnRemoveFromWatchlist>((event, emit) async {
      final movie = event.movie;
      await _removeWatchlistMovie.execute(movie);

      // final result = await _removeWatchlistMovie.execute(movie);

      // result.fold(
      //       (failure) {
      //     emit(RemoveError(failure.message));
      //   },
      //       (data) {
      //     emit(RemoveHasData());
      //   },
      // );
    });
  }
}
