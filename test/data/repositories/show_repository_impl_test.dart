import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ditonton_flutter/data/models/genre_model.dart';
import 'package:ditonton_flutter/data/models/shows/show_detail_model.dart';
import 'package:ditonton_flutter/data/models/shows/show_model.dart';
import 'package:ditonton_flutter/data/repositories/show_repository_impl.dart';
import 'package:ditonton_flutter/common/exception.dart';
import 'package:ditonton_flutter/common/failure.dart';
import 'package:ditonton_flutter/domain/entities/shows/show.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/shows/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late ShowRepositoryImpl repository;
  late MockShowRemoteDataSource mockRemoteDataSource;
  late MockShowLocalDataSource mockLocalDataSource;

  setUp(() {
    mockRemoteDataSource = MockShowRemoteDataSource();
    mockLocalDataSource = MockShowLocalDataSource();
    repository = ShowRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
    );
  });

  final tShowModel = ShowModel(
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

  final tShowModelList = <ShowModel>[tShowModel];
  final tShowList = <Show>[tShow];

  group('Now Playing Shows', () {
    test(
        'should return remote data when the call to remote data source is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.getAiringTodayShows())
          .thenAnswer((_) async => tShowModelList);
      // act
      final result = await repository.getAiringTodayShows();
      // assert
      verify(mockRemoteDataSource.getAiringTodayShows());
      /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
      final resultList = result.getOrElse(() => []);
      expect(resultList, tShowList);
    });

    test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getAiringTodayShows())
          .thenThrow(ServerException());
      // act
      final result = await repository.getAiringTodayShows();
      // assert
      verify(mockRemoteDataSource.getAiringTodayShows());
      expect(result, equals(Left(ServerFailure(''))));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getAiringTodayShows())
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getAiringTodayShows();
      // assert
      verify(mockRemoteDataSource.getAiringTodayShows());
      expect(result,
          equals(Left(ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('Popular Shows', () {
    test('should return show list when call to data source is success',
        () async {
      // arrange
      when(mockRemoteDataSource.getPopularShows())
          .thenAnswer((_) async => tShowModelList);
      // act
      final result = await repository.getPopularShows();
      // assert
      /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
      final resultList = result.getOrElse(() => []);
      expect(resultList, tShowList);
    });

    test(
        'should return server failure when call to data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getPopularShows()).thenThrow(ServerException());
      // act
      final result = await repository.getPopularShows();
      // assert
      expect(result, Left(ServerFailure('')));
    });

    test(
        'should return connection failure when device is not connected to the internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getPopularShows())
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getPopularShows();
      // assert
      expect(
          result, Left(ConnectionFailure('Failed to connect to the network')));
    });
  });

  group('Top Rated Shows', () {
    test('should return show list when call to data source is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.getTopRatedShows())
          .thenAnswer((_) async => tShowModelList);
      // act
      final result = await repository.getTopRatedShows();
      // assert
      /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
      final resultList = result.getOrElse(() => []);
      expect(resultList, tShowList);
    });

    test('should return ServerFailure when call to data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getTopRatedShows())
          .thenThrow(ServerException());
      // act
      final result = await repository.getTopRatedShows();
      // assert
      expect(result, Left(ServerFailure('')));
    });

    test(
        'should return ConnectionFailure when device is not connected to the internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getTopRatedShows())
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getTopRatedShows();
      // assert
      expect(
          result, Left(ConnectionFailure('Failed to connect to the network')));
    });
  });

  group('Get Show Detail', () {
    final tId = 1;
    final tShowResponse = ShowDetailResponse(
      adult: false,
      backdropPath: 'backdropPath',
      firstAirDate: 'firstAirDate',
      genres: [GenreModel(id: 1, name: 'Action')],
      homepage: "https://google.com",
      id: 1,
      name: 'name',
      numberOfEpisodes: 10,
      numberOfSeasons: 2,
      originalLanguage: 'en',
      originalName: 'originalName',
      overview: 'overview',
      popularity: 1,
      posterPath: 'posterPath',
      status: 'Status',
      tagline: 'Tagline',
      voteAverage: 1,
      voteCount: 1,
    );

    test(
        'should return Show data when the call to remote data source is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.getShowDetail(tId))
          .thenAnswer((_) async => tShowResponse);
      // act
      final result = await repository.getShowDetail(tId);
      // assert
      verify(mockRemoteDataSource.getShowDetail(tId));
      expect(result, equals(Right(testShowDetail)));
    });

    test(
        'should return Server Failure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getShowDetail(tId))
          .thenThrow(ServerException());
      // act
      final result = await repository.getShowDetail(tId);
      // assert
      verify(mockRemoteDataSource.getShowDetail(tId));
      expect(result, equals(Left(ServerFailure(''))));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getShowDetail(tId))
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getShowDetail(tId);
      // assert
      verify(mockRemoteDataSource.getShowDetail(tId));
      expect(result,
          equals(Left(ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('Get Show Recommendations', () {
    final tShowList = <ShowModel>[];
    final tId = 1;

    test('should return data (show list) when the call is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.getShowRecommendations(tId))
          .thenAnswer((_) async => tShowList);
      // act
      final result = await repository.getShowRecommendations(tId);
      // assert
      verify(mockRemoteDataSource.getShowRecommendations(tId));
      /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
      final resultList = result.getOrElse(() => []);
      expect(resultList, equals(tShowList));
    });

    test(
        'should return server failure when call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getShowRecommendations(tId))
          .thenThrow(ServerException());
      // act
      final result = await repository.getShowRecommendations(tId);
      // assertbuild runner
      verify(mockRemoteDataSource.getShowRecommendations(tId));
      expect(result, equals(Left(ServerFailure(''))));
    });

    test(
        'should return connection failure when the device is not connected to the internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getShowRecommendations(tId))
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getShowRecommendations(tId);
      // assert
      verify(mockRemoteDataSource.getShowRecommendations(tId));
      expect(result,
          equals(Left(ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('Seach Shows', () {
    final tQuery = 'tagesschau';

    test('should return show list when call to data source is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.searchShows(tQuery))
          .thenAnswer((_) async => tShowModelList);
      // act
      final result = await repository.searchShows(tQuery);
      // assert
      /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
      final resultList = result.getOrElse(() => []);
      expect(resultList, tShowList);
    });

    test('should return ServerFailure when call to data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.searchShows(tQuery))
          .thenThrow(ServerException());
      // act
      final result = await repository.searchShows(tQuery);
      // assert
      expect(result, Left(ServerFailure('')));
    });

    test(
        'should return ConnectionFailure when device is not connected to the internet',
        () async {
      // arrange
      when(mockRemoteDataSource.searchShows(tQuery))
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await repository.searchShows(tQuery);
      // assert
      expect(
          result, Left(ConnectionFailure('Failed to connect to the network')));
    });
  });

  group('save watchlist', () {
    test('should return success message when saving successful', () async {
      // arrange
      when(mockLocalDataSource.insertWatchlist(testShowTable))
          .thenAnswer((_) async => 'Added to Watchlist');
      // act
      final result = await repository.saveWatchlistShow(testShowDetail);
      // assert
      expect(result, Right('Added to Watchlist'));
    });

    test('should return DatabaseFailure when saving unsuccessful', () async {
      // arrange
      when(mockLocalDataSource.insertWatchlist(testShowTable))
          .thenThrow(DatabaseException('Failed to add watchlist'));
      // act
      final result = await repository.saveWatchlistShow(testShowDetail);
      // assert
      expect(result, Left(DatabaseFailure('Failed to add watchlist')));
    });
  });

  group('remove watchlist', () {
    test('should return success message when remove successful', () async {
      // arrange
      when(mockLocalDataSource.removeWatchlist(testShowTable))
          .thenAnswer((_) async => 'Removed from watchlist');
      // act
      final result = await repository.removeWatchlistShow(testShowDetail);
      // assert
      expect(result, Right('Removed from watchlist'));
    });

    test('should return DatabaseFailure when remove unsuccessful', () async {
      // arrange
      when(mockLocalDataSource.removeWatchlist(testShowTable))
          .thenThrow(DatabaseException('Failed to remove watchlist'));
      // act
      final result = await repository.removeWatchlistShow(testShowDetail);
      // assert
      expect(result, Left(DatabaseFailure('Failed to remove watchlist')));
    });
  });

  group('get watchlist status', () {
    test('should return watch status whether data is found', () async {
      // arrange
      final tId = 1;
      when(mockLocalDataSource.getShowById(tId)).thenAnswer((_) async => null);
      // act
      final result = await repository.isAddedToWatchlistShow(tId);
      // assert
      expect(result, false);
    });
  });

  group('get watchlist shows', () {
    test('should return list of Shows', () async {
      // arrange
      when(mockLocalDataSource.getWatchlistShows())
          .thenAnswer((_) async => [testShowTable]);
      // act
      final result = await repository.getWatchlistShows();
      // assert
      final resultList = result.getOrElse(() => []);
      expect(resultList, [testWatchlistShow]);
    });
  });
}
