import 'package:ditonton_flutter/common/exception.dart';
import 'package:ditonton_flutter/data/datasources/shows/show_local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late ShowLocalDataSourceImpl dataSource;
  late MockDatabaseHelper mockDatabaseHelper;

  setUp(() {
    mockDatabaseHelper = MockDatabaseHelper();
    dataSource = ShowLocalDataSourceImpl(databaseHelper: mockDatabaseHelper);
  });

  group('save watchlist', () {
    test('should return success message when insert to database is success',
        () async {
      // arrange
      when(mockDatabaseHelper.insertWatchlistShow(testShowTable))
          .thenAnswer((_) async => 1);
      // act
      final result = await dataSource.insertWatchlist(testShowTable);
      // assert
      expect(result, 'Added to Watchlist');
    });

    test('should throw DatabaseException when insert to database is failed',
        () async {
      // arrange
      when(mockDatabaseHelper.insertWatchlistShow(testShowTable))
          .thenThrow(Exception());
      // act
      final call = dataSource.insertWatchlist(testShowTable);
      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('remove watchlist', () {
    test('should return success message when remove from database is success',
        () async {
      // arrange
      when(mockDatabaseHelper.removeWatchlistShow(testShowTable))
          .thenAnswer((_) async => 1);
      // act
      final result = await dataSource.removeWatchlist(testShowTable);
      // assert
      expect(result, 'Removed from Watchlist');
    });

    test('should throw DatabaseException when remove from database is failed',
        () async {
      // arrange
      when(mockDatabaseHelper.removeWatchlistShow(testShowTable))
          .thenThrow(Exception());
      // act
      final call = dataSource.removeWatchlist(testShowTable);
      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('Get Show Detail By Id', () {
    const tId = 1;

    test('should return Show Detail Table when data is found', () async {
      // arrange
      when(mockDatabaseHelper.getShowById(tId))
          .thenAnswer((_) async => testShowMap);
      // act
      final result = await dataSource.getShowById(tId);
      // assert
      expect(result, testShowTable);
    });

    test('should return null when data is not found', () async {
      // arrange
      when(mockDatabaseHelper.getShowById(tId)).thenAnswer((_) async => null);
      // act
      final result = await dataSource.getShowById(tId);
      // assert
      expect(result, null);
    });
  });

  group('get watchlist shows', () {
    test('should return list of ShowTable from database', () async {
      // arrange
      when(mockDatabaseHelper.getWatchlistShows())
          .thenAnswer((_) async => [testShowMap]);
      // act
      final result = await dataSource.getWatchlistShows();
      // assert
      expect(result, [testShowTable]);
    });
  });
}
