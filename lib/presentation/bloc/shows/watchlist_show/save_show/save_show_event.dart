part of 'save_show_bloc.dart';

abstract class SaveShowEvent extends Equatable {
  const SaveShowEvent();

  @override
  List<Object> get props => [];
}

class OnSaveFromWatchlist extends SaveShowEvent {
  final ShowDetail show;

  const OnSaveFromWatchlist(this.show);

  @override
  List<Object> get props => [show];
}
