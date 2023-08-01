import 'package:bloc/bloc.dart';
import 'package:ditonton_flutter/domain/entities/shows/show.dart';
import 'package:ditonton_flutter/domain/entities/shows/show_detail.dart';
import 'package:ditonton_flutter/domain/usecases/shows/get_show_detail.dart';
import 'package:ditonton_flutter/domain/usecases/shows/get_show_recommendations.dart';
import 'package:ditonton_flutter/domain/usecases/shows/get_watchlist_show_status.dart';
import 'package:ditonton_flutter/domain/usecases/shows/get_watchlist_shows.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

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
