part of 'movie_detail_bloc.dart';

abstract class MovieDetailEvent extends Equatable {
  const MovieDetailEvent();

  @override
  List<Object> get props => [];
}

class OnMovieDetail extends MovieDetailEvent {
  final int id;

  OnMovieDetail(this.id);

  @override
  List<Object> get props => [id];
}

// class OnMovieRecommendations extends MovieDetailEvent {
//   final int id;
//
//   OnMovieRecommendations(this.id);
//
//   @override
//   List<Object> get props => [id];
// }
