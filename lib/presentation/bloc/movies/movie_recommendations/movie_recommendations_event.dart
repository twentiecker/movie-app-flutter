part of 'movie_recommendations_bloc.dart';

abstract class MovieRecommendationsEvent extends Equatable {
  const MovieRecommendationsEvent();

  @override
  List<Object> get props => [];
}

class OnMovieRecommendations extends MovieRecommendationsEvent {
  final int id;

  const OnMovieRecommendations(this.id);

  @override
  List<Object> get props => [id];
}
