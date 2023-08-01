part of 'movie_detail_bloc.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object> get props => [];
}

class DetailEmpty extends MovieDetailState {}

class DetailLoading extends MovieDetailState {}

class DetailError extends MovieDetailState {
  final String message;

  const DetailError(this.message);

  @override
  List<Object> get props => [message];
}

class DetailHasData extends MovieDetailState {
  final MovieDetail result;

  const DetailHasData(this.result);

  @override
  List<Object> get props => [result];
}

// class RecommendationsEmpty extends MovieDetailState {}
//
// class RecommendationsLoading extends MovieDetailState {}
//
// class RecommendationsError extends MovieDetailState {
//   final String message;
//
//   RecommendationsError(this.message);
//
//   @override
//   List<Object> get props => [message];
// }
//
// class RecommendationsHasData extends MovieDetailState {
//   final List<Movie> result;
//
//   RecommendationsHasData(this.result);
//
//   @override
//   List<Object> get props => [result];
// }
