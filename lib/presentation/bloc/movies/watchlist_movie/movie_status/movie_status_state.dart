part of 'movie_status_bloc.dart';

abstract class MovieStatusState extends Equatable {
  const MovieStatusState();

  @override
  List<Object> get props => [];
}

class StatusEmpty extends MovieStatusState {}

class StatusHasData extends MovieStatusState {
  final bool result;

  const StatusHasData(this.result);

  @override
  List<Object> get props => [result];
}
