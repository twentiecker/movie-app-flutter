import 'package:bloc/bloc.dart';
import 'package:ditonton_flutter/domain/entities/movies/movie.dart';
import 'package:ditonton_flutter/domain/entities/movies/movie_detail.dart';
import 'package:ditonton_flutter/domain/usecases/movies/get_movie_detail.dart';
import 'package:ditonton_flutter/domain/usecases/movies/get_movie_recommendations.dart';
import 'package:ditonton_flutter/presentation/bloc/movies/movie_recommendations/movie_recommendations_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

part '../movie_detail/movie_detail_event.dart';

part '../movie_detail/movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail _getMovieDetail;

  // final GetMovieRecommendations _getMovieRecommendations;

  // MovieDetailBloc(this._getMovieDetail, this._getMovieRecommendations)
  MovieDetailBloc(this._getMovieDetail) : super(DetailEmpty()) {
    on<OnMovieDetail>((event, emit) async {
      final id = event.id;

      emit(DetailLoading());
      final result = await _getMovieDetail.execute(id);

      result.fold(
        (failure) {
          emit(DetailError(failure.message));
        },
        (data) {
          emit(DetailHasData(data));
        },
      );
    });

    // on<OnMovieRecommendations>((event, emit) async {
    //   final id = event.id;
    //
    //   emit(RecommendationsLoading());
    //   final result = await _getMovieRecommendations.execute(id);
    //
    //   result.fold(
    //     (failure) {
    //       emit(RecommendationsError(failure.message));
    //     },
    //     (data) {
    //       emit(RecommendationsHasData(data));
    //     },
    //   );
    // });
  }
}
