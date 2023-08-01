part of 'show_search_bloc.dart';

abstract class ShowSearchEvent extends Equatable {
  const ShowSearchEvent();

  @override
  List<Object> get props => [];
}

class OnQueryChanged extends ShowSearchEvent {
  final String query;

  const OnQueryChanged(this.query);

  @override
  List<Object> get props => [query];
}
