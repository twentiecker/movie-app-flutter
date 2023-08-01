import 'package:ditonton_flutter/domain/entities/movies/movie.dart';
import 'package:ditonton_flutter/domain/usecases/movies/get_top_rated_movies.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../top_rated_movies/top_rated_movies_event.dart';

part '../top_rated_movies/top_rated_movies_state.dart';

class TopRatedMoviesBloc
    extends Bloc<TopRatedMoviesEvent, TopRatedMoviesState> {
  final GetTopRatedMovies _getTopRatedMovies;

  TopRatedMoviesBloc(this._getTopRatedMovies) : super(TopRatedEmpty()) {
    on<OnTopRatedMovies>((event, emit) async {
      emit(TopRatedLoading());
      final result = await _getTopRatedMovies.execute();

      result.fold(
        (failure) {
          emit(TopRatedError(failure.message));
        },
        (data) {
          emit(TopRatedHasData(data));
        },
      );
    });
  }
}
