part of 'show_recommendations_bloc.dart';

abstract class ShowRecommendationsState extends Equatable {
  const ShowRecommendationsState();

  @override
  List<Object> get props => [];
}

class RecommendationsEmpty extends ShowRecommendationsState {}

class RecommendationsLoading extends ShowRecommendationsState {}

class RecommendationsError extends ShowRecommendationsState {
  final String message;

  const RecommendationsError(this.message);

  @override
  List<Object> get props => [message];
}

class RecommendationsHasData extends ShowRecommendationsState {
  final List<Show> result;

  const RecommendationsHasData(this.result);

  @override
  List<Object> get props => [result];
}
