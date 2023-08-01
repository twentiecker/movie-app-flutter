import 'package:bloc/bloc.dart';
import 'package:ditonton_flutter/domain/entities/movies/movie.dart';
import 'package:ditonton_flutter/domain/entities/movies/movie_detail.dart';
import 'package:ditonton_flutter/domain/usecases/movies/get_movie_detail.dart';
import 'package:ditonton_flutter/domain/usecases/movies/get_movie_recommendations.dart';
import 'package:ditonton_flutter/domain/usecases/movies/get_watchlist_movie_status.dart';
import 'package:ditonton_flutter/domain/usecases/movies/remove_watchlist_movie.dart';
import 'package:ditonton_flutter/presentation/bloc/movies/movie_recommendations/movie_recommendations_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

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
