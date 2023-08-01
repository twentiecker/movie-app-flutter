import 'package:dartz/dartz.dart';
import 'package:ditonton_flutter/common/failure.dart';
import 'package:ditonton_flutter/common/state_enum.dart';
import 'package:ditonton_flutter/domain/entities/shows/show.dart';
import 'package:ditonton_flutter/domain/usecases/shows/get_popular_shows.dart';
import 'package:ditonton_flutter/presentation/provider/shows/popular_shows_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'popular_shows_notifier_test.mocks.dart';

@GenerateMocks([GetPopularShows])
void main() {
  late MockGetPopularShows mockGetPopularShows;
  late PopularShowsNotifier notifier;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetPopularShows = MockGetPopularShows();
    notifier = PopularShowsNotifier(mockGetPopularShows)
      ..addListener(() {
        listenerCallCount++;
      });
  });

  final tShow = Show(
    backdropPath: "/jWXrQstj7p3Wl5MfYWY6IHqRpDb.jpg",
    firstAirDate: "1952-12-26",
    genreIds: const [10763],
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

  test('should change state to loading when usecase is called', () async {
    // arrange
    when(mockGetPopularShows.execute())
        .thenAnswer((_) async => Right(tShowList));
    // act
    notifier.fetchPopularShows();
    // assert
    expect(notifier.state, RequestState.loading);
    expect(listenerCallCount, 1);
  });

  test('should change shows data when data is gotten successfully', () async {
    // arrange
    when(mockGetPopularShows.execute())
        .thenAnswer((_) async => Right(tShowList));
    // act
    await notifier.fetchPopularShows();
    // assert
    expect(notifier.state, RequestState.loaded);
    expect(notifier.shows, tShowList);
    expect(listenerCallCount, 2);
  });

  test('should return error when data is unsuccessful', () async {
    // arrange
    when(mockGetPopularShows.execute())
        .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
    // act
    await notifier.fetchPopularShows();
    // assert
    expect(notifier.state, RequestState.error);
    expect(notifier.message, 'Server Failure');
    expect(listenerCallCount, 2);
  });
}
