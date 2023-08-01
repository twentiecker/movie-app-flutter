part of 'show_list_bloc.dart';

abstract class ShowListState extends Equatable {
  const ShowListState();

  @override
  List<Object> get props => [];
}

class ShowListEmpty extends ShowListState {}

class ShowListLoading extends ShowListState {}

class ShowListError extends ShowListState {
  final String message;

  ShowListError(this.message);

  @override
  List<Object> get props => [message];
}

class ShowListHasData extends ShowListState {
  final List<Show> result;

  ShowListHasData(this.result);

  @override
  List<Object> get props => [result];
}
