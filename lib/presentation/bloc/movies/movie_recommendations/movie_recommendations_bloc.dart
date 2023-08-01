import 'package:bloc/bloc.dart';
import 'package:ditonton_flutter/domain/entities/movies/movie.dart';
import 'package:ditonton_flutter/domain/usecases/movies/get_movie_detail.dart';
import 'package:ditonton_flutter/domain/usecases/movies/get_movie_recommendations.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

part '../movie_recommendations/movie_recommendations_event.dart';

part '../movie_recommendations/movie_recommendations_state.dart';

class MovieRecommendationsBloc extends Bloc<MovieRecommendationsEvent, MovieRecommendationsState> {
  final GetMovieRecommendations _getMovieRecommendations;

  MovieRecommendationsBloc(this._getMovieRecommendations) : super(RecommendationsEmpty()) {
    on<OnMovieRecommendations>((event, emit) async {
      final id = event.id;

      emit(RecommendationsLoading());
      final result = await _getMovieRecommendations.execute(id);

      result.fold(
        (failure) {
          emit(RecommendationsError(failure.message));
        },
        (data) {
          emit(RecommendationsHasData(data));
        },
      );
    });
  }
}
