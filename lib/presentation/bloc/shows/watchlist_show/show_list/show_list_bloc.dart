import 'package:ditonton_flutter/domain/entities/shows/show.dart';
import 'package:ditonton_flutter/domain/usecases/shows/get_watchlist_shows.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../show_list/show_list_event.dart';

part '../show_list/show_list_state.dart';

class ShowListBloc extends Bloc<ShowListEvent, ShowListState> {
  final GetWatchlistShows _getWatchlistShows;

  ShowListBloc(this._getWatchlistShows) : super(ShowListEmpty()) {
    on<OnGetWatchlistShows>((event, emit) async {
      final result = await _getWatchlistShows.execute();

      result.fold(
        (failure) {
          emit(ShowListError(failure.message));
        },
        (data) {
          emit(ShowListHasData(data));
        },
      );
    });
  }
}
