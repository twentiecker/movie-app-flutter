part of 'remove_movie_bloc.dart';

abstract class RemoveMovieState extends Equatable {
  const RemoveMovieState();

  @override
  List<Object> get props => [];
}

class RemoveEmpty extends RemoveMovieState {}

class RemoveError extends RemoveMovieState {
  final String message;

  const RemoveError(this.message);

  @override
  List<Object> get props => [message];
}
