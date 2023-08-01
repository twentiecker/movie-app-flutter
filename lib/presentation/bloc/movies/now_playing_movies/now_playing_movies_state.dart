part of 'now_playing_movies_bloc.dart';

abstract class NowPlayingMoviesState extends Equatable {
  const NowPlayingMoviesState();

  @override
  List<Object> get props => [];
}

class NowPlayingEmpty extends NowPlayingMoviesState {}

class NowPlayingLoading extends NowPlayingMoviesState {}

class NowPlayingError extends NowPlayingMoviesState {
  final String message;

  NowPlayingError(this.message);

  @override
  List<Object> get props => [message];
}

class NowPlayingHasData extends NowPlayingMoviesState {
  final List<Movie> result;

  NowPlayingHasData(this.result);

  @override
  List<Object> get props => [result];
}
