import 'package:dartz/dartz.dart';
import 'package:ditonton_flutter/domain/entities/shows/show.dart';
import 'package:ditonton_flutter/domain/usecases/shows/get_show_recommendations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetShowRecommendations usecase;
  late MockShowRepository mockShowRepository;

  setUp(() {
    mockShowRepository = MockShowRepository();
    usecase = GetShowRecommendations(mockShowRepository);
  });

  final tId = 1;
  final tShows = <Show>[];

  test('should get list of show recommendations from the repository',
      () async {
    // arrange
    when(mockShowRepository.getShowRecommendations(tId))
        .thenAnswer((_) async => Right(tShows));
    // act
    final result = await usecase.execute(tId);
    // assert
    expect(result, Right(tShows));
  });
}
