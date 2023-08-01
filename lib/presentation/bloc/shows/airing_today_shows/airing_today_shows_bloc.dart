import 'package:ditonton_flutter/domain/entities/shows/show.dart';
import 'package:ditonton_flutter/domain/usecases/shows/get_airing_today_shows.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../airing_today_shows/airing_today_shows_event.dart';

part '../airing_today_shows/airing_today_shows_state.dart';

class AiringTodayShowsBloc extends Bloc<AiringTodayShowsEvent, AiringTodayShowsState> {
  final GetAiringTodayShows _getAiringTodayShows;

  AiringTodayShowsBloc(this._getAiringTodayShows) : super(AiringTodayEmpty()) {
    on<OnAiringTodayShows>((event, emit) async {
      emit(AiringTodayLoading());
      final result = await _getAiringTodayShows.execute();

      result.fold(
        (failure) {
          emit(AiringTodayError(failure.message));
        },
        (data) {
          emit(AiringTodayHasData(data));
        },
      );
    });
  }
}
