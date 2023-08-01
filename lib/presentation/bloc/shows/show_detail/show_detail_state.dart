part of 'show_detail_bloc.dart';

abstract class ShowDetailState extends Equatable {
  const ShowDetailState();

  @override
  List<Object> get props => [];
}

class DetailEmpty extends ShowDetailState {}

class DetailLoading extends ShowDetailState {}

class DetailError extends ShowDetailState {
  final String message;

  const DetailError(this.message);

  @override
  List<Object> get props => [message];
}

class DetailHasData extends ShowDetailState {
  final ShowDetail result;

  const DetailHasData(this.result);

  @override
  List<Object> get props => [result];
}
