part of 'save_movie_bloc.dart';

abstract class SaveMovieEvent extends Equatable {
  const SaveMovieEvent();

  @override
  List<Object> get props => [];
}

class OnSaveFromWatchlist extends SaveMovieEvent {
  final MovieDetail movie;

  const OnSaveFromWatchlist(this.movie);

  @override
  List<Object> get props => [movie];
}
