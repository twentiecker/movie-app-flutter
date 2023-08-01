part of 'movie_status_bloc.dart';

abstract class MovieStatusEvent extends Equatable {
  const MovieStatusEvent();

  @override
  List<Object> get props => [];
}

class OnLoadWatchlistStatus extends MovieStatusEvent {
  final int id;

  OnLoadWatchlistStatus(this.id);

  @override
  List<Object> get props => [id];
}
