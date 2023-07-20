import 'package:dartz/dartz.dart';
import 'package:ditonton_flutter/domain/entities/shows/show.dart';
import 'package:ditonton_flutter/domain/usecases/shows/search_shows.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';


void main() {
  late SearchShows usecase;
  late MockShowRepository mockShowRepository;

  setUp(() {
    mockShowRepository = MockShowRepository();
    usecase = SearchShows(mockShowRepository);
  });

  final tShows = <Show>[];
  final tQuery = 'Tagesschau';

  test('should get list of shows from the repository', () async {
    // arrange
    when(mockShowRepository.searchShows(tQuery))
        .thenAnswer((_) async => Right(tShows));
    // act
    final result = await usecase.execute(tQuery);
    // assert
    expect(result, Right(tShows));
  });
}
