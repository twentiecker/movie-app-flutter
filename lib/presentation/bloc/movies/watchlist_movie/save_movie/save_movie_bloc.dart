import 'package:ditonton_flutter/domain/entities/movies/movie_detail.dart';
import 'package:ditonton_flutter/domain/usecases/movies/save_watchlist_movie.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../save_movie/save_movie_event.dart';

part '../save_movie/save_movie_state.dart';

class SaveMovieBloc extends Bloc<SaveMovieEvent, SaveMovieState> {
  final SaveWatchlistMovie _saveWatchlistMovie;

  SaveMovieBloc(this._saveWatchlistMovie) : super(SaveEmpty()) {
    on<OnSaveFromWatchlist>((event, emit) async {
      final movie = event.movie;
      await _saveWatchlistMovie.execute(movie);
    });
  }
}
