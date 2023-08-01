import 'package:dartz/dartz.dart';
import 'package:ditonton_flutter/domain/usecases/shows/remove_watchlist_show.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/shows/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late RemoveWatchlistShow usecase;
  late MockShowRepository mockShowRepository;

  setUp(() {
    mockShowRepository = MockShowRepository();
    usecase = RemoveWatchlistShow(mockShowRepository);
  });

  test('should remove watchlist show from repository', () async {
    // arrange
    when(mockShowRepository.removeWatchlistShow(testShowDetail))
        .thenAnswer((_) async => Right('Removed from watchlist'));
    // act
    final result = await usecase.execute(testShowDetail);
    // assert
    verify(mockShowRepository.removeWatchlistShow(testShowDetail));
    expect(result, Right('Removed from watchlist'));
  });
}
