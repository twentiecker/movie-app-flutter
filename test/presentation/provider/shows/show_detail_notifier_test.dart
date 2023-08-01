import 'package:dartz/dartz.dart';
import 'package:ditonton_flutter/domain/entities/shows/show.dart';
import 'package:ditonton_flutter/domain/usecases/shows/get_show_detail.dart';
import 'package:ditonton_flutter/domain/usecases/shows/get_show_recommendations.dart';
import 'package:ditonton_flutter/common/failure.dart';
import 'package:ditonton_flutter/domain/usecases/shows/get_watchlist_show_status.dart';
import 'package:ditonton_flutter/domain/usecases/shows/remove_watchlist_show.dart';
import 'package:ditonton_flutter/domain/usecases/shows/save_watchlist_show.dart';
import 'package:ditonton_flutter/presentation/provider/shows/show_detail_notifier.dart';
import 'package:ditonton_flutter/common/state_enum.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/shows/dummy_objects.dart';
import 'show_detail_notifier_test.mocks.dart';

@GenerateMocks([
  GetShowDetail,
  GetShowRecommendations,
  GetWatchListShowStatus,
  SaveWatchlistShow,
  RemoveWatchlistShow,
])
void main() {
  late ShowDetailNotifier provider;
  late MockGetShowDetail mockGetShowDetail;
  late MockGetShowRecommendations mockGetShowRecommendations;
  late MockGetWatchListShowStatus mockGetWatchlistStatus;
  late MockSaveWatchlistShow mockSaveWatchlist;
  late MockRemoveWatchlistShow mockRemoveWatchlist;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetShowDetail = MockGetShowDetail();
    mockGetShowRecommendations = MockGetShowRecommendations();
    mockGetWatchlistStatus = MockGetWatchListShowStatus();
    mockSaveWatchlist = MockSaveWatchlistShow();
    mockRemoveWatchlist = MockRemoveWatchlistShow();
    provider = ShowDetailNotifier(
      getShowDetail: mockGetShowDetail,
      getShowRecommendations: mockGetShowRecommendations,
      getWatchListShowStatus: mockGetWatchlistStatus,
      saveWatchlist: mockSaveWatchlist,
      removeWatchlist: mockRemoveWatchlist,
    )..addListener(() {
        listenerCallCount += 1;
      });
  });

  final tId = 1;

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
  final tShows = <Show>[tShow];

  void _arrangeUsecase() {
    when(mockGetShowDetail.execute(tId))
        .thenAnswer((_) async => Right(testShowDetail));
    when(mockGetShowRecommendations.execute(tId))
        .thenAnswer((_) async => Right(tShows));
  }

  group('Get Show Detail', () {
    test('should get data from the usecase', () async {
      // arrange
      _arrangeUsecase();
      // act
      await provider.fetchShowDetail(tId);
      // assert
      verify(mockGetShowDetail.execute(tId));
      verify(mockGetShowRecommendations.execute(tId));
    });

    test('should change state to Loading when usecase is called', () {
      // arrange
      _arrangeUsecase();
      // act
      provider.fetchShowDetail(tId);
      // assert
      expect(provider.showState, RequestState.loading);
      expect(listenerCallCount, 1);
    });

    test('should change show when data is gotten successfully', () async {
      // arrange
      _arrangeUsecase();
      // act
      await provider.fetchShowDetail(tId);
      // assert
      expect(provider.showState, RequestState.loaded);
      expect(provider.show, testShowDetail);
      expect(listenerCallCount, 3);
    });

    test('should change recommendation shows when data is gotten successfully',
        () async {
      // arrange
      _arrangeUsecase();
      // act
      await provider.fetchShowDetail(tId);
      // assert
      expect(provider.showState, RequestState.loaded);
      expect(provider.showRecommendations, tShows);
    });
  });

  group('Get Show Recommendations', () {
    test('should get data from the usecase', () async {
      // arrange
      _arrangeUsecase();
      // act
      await provider.fetchShowDetail(tId);
      // assert
      verify(mockGetShowRecommendations.execute(tId));
      expect(provider.showRecommendations, tShows);
    });

    test('should update recommendation state when data is gotten successfully',
        () async {
      // arrange
      _arrangeUsecase();
      // act
      await provider.fetchShowDetail(tId);
      // assert
      expect(provider.recommendationState, RequestState.loaded);
      expect(provider.showRecommendations, tShows);
    });

    test('should update error message when request in successful', () async {
      // arrange
      when(mockGetShowDetail.execute(tId))
          .thenAnswer((_) async => Right(testShowDetail));
      when(mockGetShowRecommendations.execute(tId))
          .thenAnswer((_) async => Left(ServerFailure('Failed')));
      // act
      await provider.fetchShowDetail(tId);
      // assert
      expect(provider.recommendationState, RequestState.error);
      expect(provider.message, 'Failed');
    });
  });

  group('Watchlist', () {
    test('should get the watchlist status', () async {
      // arrange
      when(mockGetWatchlistStatus.execute(1)).thenAnswer((_) async => true);
      // act
      await provider.loadWatchlistStatus(1);
      // assert
      expect(provider.isAddedToWatchlist, true);
    });

    test('should execute save watchlist when function called', () async {
      // arrange
      when(mockSaveWatchlist.execute(testShowDetail))
          .thenAnswer((_) async => Right('Success'));
      when(mockGetWatchlistStatus.execute(testShowDetail.id))
          .thenAnswer((_) async => true);
      // act
      await provider.addWatchlist(testShowDetail);
      // assert
      verify(mockSaveWatchlist.execute(testShowDetail));
    });

    test('should execute remove watchlist when function called', () async {
      // arrange
      when(mockRemoveWatchlist.execute(testShowDetail))
          .thenAnswer((_) async => Right('Removed'));
      when(mockGetWatchlistStatus.execute(testShowDetail.id))
          .thenAnswer((_) async => false);
      // act
      await provider.removeFromWatchlist(testShowDetail);
      // assert
      verify(mockRemoveWatchlist.execute(testShowDetail));
    });

    test('should update watchlist status when add watchlist success', () async {
      // arrange
      when(mockSaveWatchlist.execute(testShowDetail))
          .thenAnswer((_) async => Right('Added to Watchlist'));
      when(mockGetWatchlistStatus.execute(testShowDetail.id))
          .thenAnswer((_) async => true);
      // act
      await provider.addWatchlist(testShowDetail);
      // assert
      verify(mockGetWatchlistStatus.execute(testShowDetail.id));
      expect(provider.isAddedToWatchlist, true);
      expect(provider.watchlistMessage, 'Added to Watchlist');
      expect(listenerCallCount, 1);
    });

    test('should update watchlist message when add watchlist failed', () async {
      // arrange
      when(mockSaveWatchlist.execute(testShowDetail))
          .thenAnswer((_) async => Left(DatabaseFailure('Failed')));
      when(mockGetWatchlistStatus.execute(testShowDetail.id))
          .thenAnswer((_) async => false);
      // act
      await provider.addWatchlist(testShowDetail);
      // assert
      expect(provider.watchlistMessage, 'Failed');
      expect(listenerCallCount, 1);
    });
  });

  group('on Error', () {
    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetShowDetail.execute(tId))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      when(mockGetShowRecommendations.execute(tId))
          .thenAnswer((_) async => Right(tShows));
      // act
      await provider.fetchShowDetail(tId);
      // assert
      expect(provider.showState, RequestState.error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });
}
