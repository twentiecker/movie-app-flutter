import 'package:bloc/bloc.dart';
import 'package:ditonton_flutter/domain/entities/shows/show.dart';
import 'package:ditonton_flutter/domain/entities/shows/show_detail.dart';
import 'package:ditonton_flutter/domain/usecases/shows/get_show_detail.dart';
import 'package:ditonton_flutter/domain/usecases/shows/get_show_recommendations.dart';
import 'package:ditonton_flutter/presentation/bloc/shows/show_recommendations/show_recommendations_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

part '../show_detail/show_detail_event.dart';

part '../show_detail/show_detail_state.dart';

class ShowDetailBloc extends Bloc<ShowDetailEvent, ShowDetailState> {
  final GetShowDetail _getShowDetail;

  ShowDetailBloc(this._getShowDetail) : super(DetailEmpty()) {
    on<OnShowDetail>((event, emit) async {
      final id = event.id;

      emit(DetailLoading());
      final result = await _getShowDetail.execute(id);

      result.fold(
        (failure) {
          emit(DetailError(failure.message));
        },
        (data) {
          emit(DetailHasData(data));
        },
      );
    });
  }
}
