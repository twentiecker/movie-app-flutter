import 'package:ditonton_flutter/domain/entities/shows/show_detail.dart';
import 'package:ditonton_flutter/domain/usecases/shows/remove_watchlist_show.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
