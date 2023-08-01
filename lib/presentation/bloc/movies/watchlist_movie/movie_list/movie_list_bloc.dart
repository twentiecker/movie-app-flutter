import 'package:ditonton_flutter/domain/entities/movies/movie.dart';
import 'package:ditonton_flutter/domain/usecases/movies/get_watchlist_movies.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../movie_list/movie_list_event.dart';

part '../movie_list/movie_list_state.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  final GetWatchlistMovies _getWatchlistMovies;

  MovieListBloc(this._getWatchlistMovies) : super(MovieListEmpty()) {
    on<OnGetWatchlistMovies>((event, emit) async {
      final result = await _getWatchlistMovies.execute();

      result.fold(
        (failure) {
          emit(MovieListError(failure.message));
        },
        (data) {
          emit(MovieListHasData(data));
        },
      );
    });
  }
}
