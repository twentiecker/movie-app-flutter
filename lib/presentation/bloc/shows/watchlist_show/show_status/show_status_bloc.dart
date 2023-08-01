import 'package:ditonton_flutter/domain/usecases/shows/get_watchlist_show_status.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../show_status/show_status_event.dart';

part '../show_status/show_status_state.dart';

class ShowStatusBloc extends Bloc<ShowStatusEvent, ShowStatusState> {
  final GetWatchListShowStatus _getWatchListShowStatus;

  ShowStatusBloc(this._getWatchListShowStatus) : super(StatusEmpty()) {
    on<OnLoadWatchlistStatus>((event, emit) async {
      final id = event.id;

      final result = await _getWatchListShowStatus.execute(id);
      emit(StatusHasData(result));
    });
  }
}
