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

  const TopRatedError(this.message);

  @override
  List<Object> get props => [message];
}

class TopRatedHasData extends TopRatedShowsState {
  final List<Show> result;

  const TopRatedHasData(this.result);

  @override
  List<Object> get props => [result];
}
