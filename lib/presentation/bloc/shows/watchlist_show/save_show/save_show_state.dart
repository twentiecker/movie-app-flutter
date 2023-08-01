part of 'save_show_bloc.dart';

abstract class SaveShowState extends Equatable {
  const SaveShowState();

  @override
  List<Object> get props => [];
}

class SaveEmpty extends SaveShowState {}

class SaveError extends SaveShowState {
  final String message;

  const SaveError(this.message);

  @override
  List<Object> get props => [message];
}
