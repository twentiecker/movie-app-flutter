import 'package:dartz/dartz.dart';
import 'package:ditonton_flutter/domain/usecases/shows/get_watchlist_shows.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetWatchlistShows usecase;
  late MockShowRepository mockShowRepository;

  setUp(() {
    mockShowRepository = MockShowRepository();
    usecase = GetWatchlistShows(mockShowRepository);
  });

  test('should get list of shows from the repository', () async {
    // arrange
    when(mockShowRepository.getWatchlistShows())
        .thenAnswer((_) async => Right(testShowList));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(testShowList));
  });
}
