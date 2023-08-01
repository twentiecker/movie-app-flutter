part of 'show_status_bloc.dart';

abstract class ShowStatusEvent extends Equatable {
  const ShowStatusEvent();

  @override
  List<Object> get props => [];
}

class OnLoadWatchlistStatus extends ShowStatusEvent {
  final int id;

  const OnLoadWatchlistStatus(this.id);

  @override
  List<Object> get props => [id];
}
