part of 'popular_movies_bloc.dart';

abstract class PopularMoviesState extends Equatable {
  const PopularMoviesState();

  @override
  List<Object> get props => [];
}

class PopularEmpty extends PopularMoviesState {}

class PopularLoading extends PopularMoviesState {}

class PopularError extends PopularMoviesState {
  final String message;

  const PopularError(this.message);

  @override
  List<Object> get props => [message];
}

class PopularHasData extends PopularMoviesState {
  final List<Movie> result;

  const PopularHasData(this.result);

  @override
  List<Object> get props => [result];
}
