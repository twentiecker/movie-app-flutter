part of 'popular_shows_bloc.dart';

abstract class PopularShowsState extends Equatable {
  const PopularShowsState();

  @override
  List<Object> get props => [];
}

class PopularEmpty extends PopularShowsState {}

class PopularLoading extends PopularShowsState {}

class PopularError extends PopularShowsState {
  final String message;

  const PopularError(this.message);

  @override
  List<Object> get props => [message];
}

class PopularHasData extends PopularShowsState {
  final List<Show> result;

  const PopularHasData(this.result);

  @override
  List<Object> get props => [result];
}
