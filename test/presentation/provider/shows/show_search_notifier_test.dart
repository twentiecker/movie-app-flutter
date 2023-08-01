import 'package:dartz/dartz.dart';
import 'package:ditonton_flutter/common/failure.dart';
import 'package:ditonton_flutter/common/state_enum.dart';
import 'package:ditonton_flutter/domain/entities/shows/show.dart';
import 'package:ditonton_flutter/domain/usecases/shows/search_shows.dart';
import 'package:ditonton_flutter/presentation/provider/shows/show_search_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'show_search_notifier_test.mocks.dart';

@GenerateMocks([SearchShows])
void main() {
  late ShowSearchNotifier provider;
  late MockSearchShows mockSearchShows;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockSearchShows = MockSearchShows();
    provider = ShowSearchNotifier(searchShows: mockSearchShows)
      ..addListener(() {
        listenerCallCount += 1;
      });
  });

  final tShowModel = Show(
    backdropPath: "/jWXrQstj7p3Wl5MfYWY6IHqRpDb.jpg",
    firstAirDate: "1952-12-26",
    genreIds: [10763],
    id: 94722,
    name: "Tagesschau",
    originalLanguage: "de",
    originalName: "Tagesschau",
    overview:
    "German daily news program, the oldest still existing program on German television.",
    popularity: 2918.048,
    posterPath: "/7dFZJ2ZJJdcmkp05B9NWlqTJ5tq.jpg",
    voteAverage: 7.3,
    voteCount: 24,
  );
  final tShowList = <Show>[tShowModel];
  final tQuery = 'tagesschau';

  group('search shows', () {
    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockSearchShows.execute(tQuery))
          .thenAnswer((_) async => Right(tShowList));
      // act
      provider.fetchShowSearch(tQuery);
      // assert
      expect(provider.state, RequestState.loading);
    });

    test('should change search result data when data is gotten successfully',
        () async {
      // arrange
      when(mockSearchShows.execute(tQuery))
          .thenAnswer((_) async => Right(tShowList));
      // act
      await provider.fetchShowSearch(tQuery);
      // assert
      expect(provider.state, RequestState.loaded);
      expect(provider.searchResult, tShowList);
      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockSearchShows.execute(tQuery))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await provider.fetchShowSearch(tQuery);
      // assert
      expect(provider.state, RequestState.error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });
}
