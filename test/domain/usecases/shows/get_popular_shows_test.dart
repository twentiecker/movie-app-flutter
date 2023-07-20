import 'package:dartz/dartz.dart';
import 'package:ditonton_flutter/domain/entities/shows/show.dart';
import 'package:ditonton_flutter/domain/usecases/shows/get_popular_shows.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetPopularShows usecase;
  late MockShowRepository mockShowRpository;

  setUp(() {
    mockShowRpository = MockShowRepository();
    usecase = GetPopularShows(mockShowRpository);
  });

  final tShows = <Show>[];

  group('GetPopularShows Tests', () {
    group('execute', () {
      test(
          'should get list of shows from the repository when execute function is called',
          () async {
        // arrange
        when(mockShowRpository.getPopularShows())
            .thenAnswer((_) async => Right(tShows));
        // act
        final result = await usecase.execute();
        // assert
        expect(result, Right(tShows));
      });
    });
  });
}
