part of 'movie_recommendations_bloc.dart';

abstract class MovieRecommendationsState extends Equatable {
  const MovieRecommendationsState();

  @override
  List<Object> get props => [];
}

class RecommendationsEmpty extends MovieRecommendationsState {}

class RecommendationsLoading extends MovieRecommendationsState {}

class RecommendationsError extends MovieRecommendationsState {
  final String message;

  const RecommendationsError(this.message);

  @override
  List<Object> get props => [message];
}

class RecommendationsHasData extends MovieRecommendationsState {
  final List<Movie> result;

  const RecommendationsHasData(this.result);

  @override
  List<Object> get props => [result];
}
