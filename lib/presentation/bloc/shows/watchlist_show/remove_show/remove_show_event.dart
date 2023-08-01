part of 'remove_show_bloc.dart';

abstract class RemoveShowEvent extends Equatable {
  const RemoveShowEvent();

  @override
  List<Object> get props => [];
}

class OnRemoveFromWatchlist extends RemoveShowEvent {
  final ShowDetail show;

  OnRemoveFromWatchlist(this.show);

  @override
  List<Object> get props => [show];
}
