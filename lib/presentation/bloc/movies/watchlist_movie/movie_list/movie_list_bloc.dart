import 'package:bloc/bloc.dart';
import 'package:ditonton_flutter/domain/entities/movies/movie.dart';
import 'package:ditonton_flutter/domain/entities/movies/movie_detail.dart';
import 'package:ditonton_flutter/domain/usecases/movies/get_movie_detail.dart';
import 'package:ditonton_flutter/domain/usecases/movies/get_movie_recommendations.dart';
import 'package:ditonton_flutter/domain/usecases/movies/get_watchlist_movie_status.dart';
import 'package:ditonton_flutter/domain/usecases/movies/get_watchlist_movies.dart';
import 'package:ditonton_flutter/presentation/bloc/movies/movie_recommendations/movie_recommendations_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

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
