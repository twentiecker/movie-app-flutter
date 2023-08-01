part of 'show_recommendations_bloc.dart';

abstract class ShowRecommendationsEvent extends Equatable {
  const ShowRecommendationsEvent();

  @override
  List<Object> get props => [];
}

class OnShowRecommendations extends ShowRecommendationsEvent {
  final int id;

  OnShowRecommendations(this.id);

  @override
  List<Object> get props => [id];
}
