part of 'show_detail_bloc.dart';

abstract class ShowDetailEvent extends Equatable {
  const ShowDetailEvent();

  @override
  List<Object> get props => [];
}

class OnShowDetail extends ShowDetailEvent {
  final int id;

  const OnShowDetail(this.id);

  @override
  List<Object> get props => [id];
}
