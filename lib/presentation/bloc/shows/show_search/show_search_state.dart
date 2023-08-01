part of 'show_search_bloc.dart';

abstract class ShowSearchState extends Equatable {
  const ShowSearchState();

  @override
  List<Object> get props => [];
}

class SearchEmpty extends ShowSearchState {}

class SearchLoading extends ShowSearchState {}

class SearchError extends ShowSearchState {
  final String message;

  SearchError(this.message);

  @override
  List<Object> get props => [message];
}

class SearchHasData extends ShowSearchState {
  final List<Show> result;

  SearchHasData(this.result);

  @override
  List<Object> get props => [result];
}
