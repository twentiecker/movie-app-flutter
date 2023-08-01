part of 'top_rated_shows_bloc.dart';

abstract class TopRatedShowsState extends Equatable {
  const TopRatedShowsState();

  @override
  List<Object> get props => [];
}

class TopRatedEmpty extends TopRatedShowsState {}

class TopRatedLoading extends TopRatedShowsState {}

class TopRatedError extends TopRatedShowsState {
  final String message;

  TopRatedError(this.message);

  @override
  List<Object> get props => [message];
}

class TopRatedHasData extends TopRatedShowsState {
  final List<Show> result;

  TopRatedHasData(this.result);

  @override
  List<Object> get props => [result];
}
