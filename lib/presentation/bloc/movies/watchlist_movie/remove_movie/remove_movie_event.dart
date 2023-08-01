part of 'remove_movie_bloc.dart';

abstract class RemoveMovieEvent extends Equatable {
  const RemoveMovieEvent();

  @override
  List<Object> get props => [];
}

class OnRemoveFromWatchlist extends RemoveMovieEvent {
  final MovieDetail movie;

  OnRemoveFromWatchlist(this.movie);

  @override
  List<Object> get props => [movie];
}
