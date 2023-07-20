import 'package:dartz/dartz.dart';
import 'package:ditonton_flutter/domain/entities/shows/show.dart';
import 'package:ditonton_flutter/domain/usecases/shows/get_airing_today_shows.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetAiringTodayShows usecase;
  late MockShowRepository mockShowRepository;

  setUp(() {
    mockShowRepository = MockShowRepository();
    usecase = GetAiringTodayShows(mockShowRepository);
  });

  final tShows = <Show>[];

  test('should get list of shows from the repository', () async {
    // arrange
    when(mockShowRepository.getAiringTodayShows())
        .thenAnswer((_) async => Right(tShows));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(tShows));
  });
}
