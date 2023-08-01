part of 'top_rated_movies_bloc.dart';

abstract class TopRatedMoviesState extends Equatable {
  const TopRatedMoviesState();

  @override
  List<Object> get props => [];
}

class TopRatedEmpty extends TopRatedMoviesState {}

class TopRatedLoading extends TopRatedMoviesState {}

class TopRatedError extends TopRatedMoviesState {
  final String message;

  const TopRatedError(this.message);

  @override
  List<Object> get props => [message];
}

class TopRatedHasData extends TopRatedMoviesState {
  final List<Movie> result;

  const TopRatedHasData(this.result);

  @override
  List<Object> get props => [result];
}
