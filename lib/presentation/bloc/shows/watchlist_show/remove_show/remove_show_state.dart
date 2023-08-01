part of 'remove_show_bloc.dart';

abstract class RemoveShowState extends Equatable {
  const RemoveShowState();

  @override
  List<Object> get props => [];
}

class RemoveEmpty extends RemoveShowState {}

class RemoveError extends RemoveShowState {
  final String message;

  RemoveError(this.message);

  @override
  List<Object> get props => [message];
}