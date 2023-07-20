import 'package:dartz/dartz.dart';
import 'package:ditonton_flutter/common/failure.dart';
import 'package:ditonton_flutter/common/state_enum.dart';
import 'package:ditonton_flutter/domain/entities/shows/show.dart';
import 'package:ditonton_flutter/domain/usecases/shows/get_top_rated_shows.dart';
import 'package:ditonton_flutter/presentation/provider/shows/top_rated_shows_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'show_list_notifier_test.mocks.dart';


@GenerateMocks([GetTopRatedShows])
void main() {
  late MockGetTopRatedShows mockGetTopRatedShows;
  late TopRatedShowsNotifier notifier;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetTopRatedShows = MockGetTopRatedShows();
    notifier = TopRatedShowsNotifier(getTopRatedShows: mockGetTopRatedShows)
      ..addListener(() {
        listenerCallCount++;
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

  test('should change state to loading when usecase is called', () async {
    // arrange
    when(mockGetTopRatedShows.execute())
        .thenAnswer((_) async => Right(tShowList));
    // act
    notifier.fetchTopRatedShows();
    // assert
    expect(notifier.state, RequestState.Loading);
    expect(listenerCallCount, 1);
  });

  test('should change shows data when data is gotten successfully', () async {
    // arrange
    when(mockGetTopRatedShows.execute())
        .thenAnswer((_) async => Right(tShowList));
    // act
    await notifier.fetchTopRatedShows();
    // assert
    expect(notifier.state, RequestState.Loaded);
    expect(notifier.shows, tShowList);
    expect(listenerCallCount, 2);
  });

  test('should return error when data is unsuccessful', () async {
    // arrange
    when(mockGetTopRatedShows.execute())
        .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
    // act
    await notifier.fetchTopRatedShows();
    // assert
    expect(notifier.state, RequestState.Error);
    expect(notifier.message, 'Server Failure');
    expect(listenerCallCount, 2);
  });
}
