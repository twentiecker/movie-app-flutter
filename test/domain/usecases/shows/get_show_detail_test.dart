import 'package:dartz/dartz.dart';
import 'package:ditonton_flutter/domain/usecases/shows/get_show_detail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/shows/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetShowDetail usecase;
  late MockShowRepository mockShowRepository;

  setUp(() {
    mockShowRepository = MockShowRepository();
    usecase = GetShowDetail(mockShowRepository);
  });

  final tId = 1;

  test('should get show detail from the repository', () async {
    // arrange
    when(mockShowRepository.getShowDetail(tId))
        .thenAnswer((_) async => Right(testShowDetail));
    // act
    final result = await usecase.execute(tId);
    // assert
    expect(result, Right(testShowDetail));
  });
}
