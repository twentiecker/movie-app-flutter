import 'package:dartz/dartz.dart';
import 'package:ditonton_flutter/domain/usecases/shows/save_watchlist_show.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/shows/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late SaveWatchlistShow usecase;
  late MockShowRepository mockShowRepository;

  setUp(() {
    mockShowRepository = MockShowRepository();
    usecase = SaveWatchlistShow(mockShowRepository);
  });

  test('should save show to the repository', () async {
    // arrange
    when(mockShowRepository.saveWatchlistShow(testShowDetail))
        .thenAnswer((_) async => Right('Added to Watchlist'));
    // act
    final result = await usecase.execute(testShowDetail);
    // assert
    verify(mockShowRepository.saveWatchlistShow(testShowDetail));
    expect(result, Right('Added to Watchlist'));
  });
}
