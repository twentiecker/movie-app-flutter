part of 'show_status_bloc.dart';

abstract class ShowStatusState extends Equatable {
  const ShowStatusState();

  @override
  List<Object> get props => [];
}

class StatusEmpty extends ShowStatusState {}

class StatusHasData extends ShowStatusState {
  final bool result;

  const StatusHasData(this.result);

  @override
  List<Object> get props => [result];
}
