import 'package:bloc/bloc.dart';
import 'package:ditonton_flutter/domain/entities/shows/show.dart';
import 'package:ditonton_flutter/domain/entities/shows/show_detail.dart';
import 'package:ditonton_flutter/domain/usecases/shows/get_show_detail.dart';
import 'package:ditonton_flutter/domain/usecases/shows/get_show_recommendations.dart';
import 'package:ditonton_flutter/domain/usecases/shows/get_watchlist_show_status.dart';
import 'package:ditonton_flutter/domain/usecases/shows/remove_watchlist_show.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

part '../remove_show/remove_show_event.dart';

part '../remove_show/remove_show_state.dart';

class RemoveShowBloc extends Bloc<RemoveShowEvent, RemoveShowState> {
  final RemoveWatchlistShow _removeWatchlistShow;

  RemoveShowBloc(this._removeWatchlistShow) : super(RemoveEmpty()) {
    on<OnRemoveFromWatchlist>((event, emit) async {
      final show = event.show;
      await _removeWatchlistShow.execute(show);
    });
  }
}
