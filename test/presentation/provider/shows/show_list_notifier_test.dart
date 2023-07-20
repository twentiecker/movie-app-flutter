import 'package:dartz/dartz.dart';
import 'package:ditonton_flutter/domain/entities/shows/show.dart';
import 'package:ditonton_flutter/domain/usecases/shows/get_airing_today_shows.dart';
import 'package:ditonton_flutter/common/failure.dart';
import 'package:ditonton_flutter/domain/usecases/shows/get_popular_shows.dart';
import 'package:ditonton_flutter/domain/usecases/shows/get_top_rated_shows.dart';
import 'package:ditonton_flutter/presentation/provider/shows/show_list_notifier.dart';
import 'package:ditonton_flutter/common/state_enum.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'show_list_notifier_test.mocks.dart';

@GenerateMocks([GetAiringTodayShows, GetPopularShows, GetTopRatedShows])
void main() {
  late ShowListNotifier provider;
  late MockGetAiringTodayShows mockGetAiringTodayShows;
  late MockGetPopularShows mockGetPopularShows;
  late MockGetTopRatedShows mockGetTopRatedShows;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetAiringTodayShows = MockGetAiringTodayShows();
    mockGetPopularShows = MockGetPopularShows();
    mockGetTopRatedShows = MockGetTopRatedShows();
    provider = ShowListNotifier(
      getAiringTodayShows: mockGetAiringTodayShows,
      getPopularShows: mockGetPopularShows,
      getTopRatedShows: mockGetTopRatedShows,
    )..addListener(() {
        listenerCallCount += 1;
      });
  });

  final tShow = Show(
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
  final tShowList = <Show>[tShow];

  group('now playing shows', () {
    test('initialState should be Empty', () {
      expect(provider.airingTodayState, equals(RequestState.Empty));
    });

    test('should get data from the usecase', () async {
      // arrange
      when(mockGetAiringTodayShows.execute())
          .thenAnswer((_) async => Right(tShowList));
      // act
      provider.fetchAiringTodayShows();
      // assert
      verify(mockGetAiringTodayShows.execute());
    });

    test('should change state to Loading when usecase is called', () {
      // arrange
      when(mockGetAiringTodayShows.execute())
          .thenAnswer((_) async => Right(tShowList));
      // act
      provider.fetchAiringTodayShows();
      // assert
      expect(provider.airingTodayState, RequestState.Loading);
    });

    test('should change shows when data is gotten successfully', () async {
      // arrange
      when(mockGetAiringTodayShows.execute())
          .thenAnswer((_) async => Right(tShowList));
      // act
      await provider.fetchAiringTodayShows();
      // assert
      expect(provider.airingTodayState, RequestState.Loaded);
      expect(provider.airingTodayShows, tShowList);
      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetAiringTodayShows.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await provider.fetchAiringTodayShows();
      // assert
      expect(provider.airingTodayState, RequestState.Error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });

  group('popular shows', () {
    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockGetPopularShows.execute())
          .thenAnswer((_) async => Right(tShowList));
      // act
      provider.fetchPopularShows();
      // assert
      expect(provider.popularShowsState, RequestState.Loading);
      // verify(provider.setState(RequestState.Loading));
    });

    test('should change shows data when data is gotten successfully',
        () async {
      // arrange
      when(mockGetPopularShows.execute())
          .thenAnswer((_) async => Right(tShowList));
      // act
      await provider.fetchPopularShows();
      // assert
      expect(provider.popularShowsState, RequestState.Loaded);
      expect(provider.popularShows, tShowList);
      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetPopularShows.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await provider.fetchPopularShows();
      // assert
      expect(provider.popularShowsState, RequestState.Error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });

  group('top rated shows', () {
    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockGetTopRatedShows.execute())
          .thenAnswer((_) async => Right(tShowList));
      // act
      provider.fetchTopRatedShows();
      // assert
      expect(provider.topRatedShowsState, RequestState.Loading);
    });

    test('should change shows data when data is gotten successfully',
        () async {
      // arrange
      when(mockGetTopRatedShows.execute())
          .thenAnswer((_) async => Right(tShowList));
      // act
      await provider.fetchTopRatedShows();
      // assert
      expect(provider.topRatedShowsState, RequestState.Loaded);
      expect(provider.topRatedShows, tShowList);
      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetTopRatedShows.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await provider.fetchTopRatedShows();
      // assert
      expect(provider.topRatedShowsState, RequestState.Error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });
}
