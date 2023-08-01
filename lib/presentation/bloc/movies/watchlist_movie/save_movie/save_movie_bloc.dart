import 'package:bloc/bloc.dart';
import 'package:ditonton_flutter/domain/entities/movies/movie.dart';
import 'package:ditonton_flutter/domain/entities/movies/movie_detail.dart';
import 'package:ditonton_flutter/domain/usecases/movies/get_movie_detail.dart';
import 'package:ditonton_flutter/domain/usecases/movies/get_movie_recommendations.dart';
import 'package:ditonton_flutter/domain/usecases/movies/get_watchlist_movie_status.dart';
import 'package:ditonton_flutter/domain/usecases/movies/remove_watchlist_movie.dart';
import 'package:ditonton_flutter/domain/usecases/movies/save_watchlist_movie.dart';
import 'package:ditonton_flutter/presentation/bloc/movies/movie_recommendations/movie_recommendations_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

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
