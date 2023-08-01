import 'package:ditonton_flutter/domain/entities/movies/movie.dart';
import 'package:ditonton_flutter/domain/usecases/movies/get_now_playing_movies.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../now_playing_movies/now_playing_movies_event.dart';

part '../now_playing_movies/now_playing_movies_state.dart';

class NowPlayingMoviesBloc extends Bloc<NowPlayingMoviesEvent, NowPlayingMoviesState> {
  final GetNowPlayingMovies _getNowPlayingMovies;

  NowPlayingMoviesBloc(this._getNowPlayingMovies) : super(NowPlayingEmpty()) {
    on<OnNowPlayingMovies>((event, emit) async {
      emit(NowPlayingLoading());
      final result = await _getNowPlayingMovies.execute();

      result.fold(
        (failure) {
          emit(NowPlayingError(failure.message));
        },
        (data) {
          emit(NowPlayingHasData(data));
        },
      );
    });
  }
}
