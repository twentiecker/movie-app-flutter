part of 'save_movie_bloc.dart';

abstract class SaveMovieState extends Equatable {
  const SaveMovieState();

  @override
  List<Object> get props => [];
}

class SaveEmpty extends SaveMovieState {}

class SaveError extends SaveMovieState {
  final String message;

  const SaveError(this.message);

  @override
  List<Object> get props => [message];
}
