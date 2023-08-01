part of 'airing_today_shows_bloc.dart';

abstract class AiringTodayShowsState extends Equatable {
  const AiringTodayShowsState();

  @override
  List<Object> get props => [];
}

class AiringTodayEmpty extends AiringTodayShowsState {}

class AiringTodayLoading extends AiringTodayShowsState {}

class AiringTodayError extends AiringTodayShowsState {
  final String message;

  AiringTodayError(this.message);

  @override
  List<Object> get props => [message];
}

class AiringTodayHasData extends AiringTodayShowsState {
  final List<Show> result;

  AiringTodayHasData(this.result);

  @override
  List<Object> get props => [result];
}
