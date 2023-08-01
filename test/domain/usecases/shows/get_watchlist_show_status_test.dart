import 'package:ditonton_flutter/domain/usecases/shows/get_watchlist_show_status.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetWatchListShowStatus usecase;
  late MockShowRepository mockShowRepository;

  setUp(() {
    mockShowRepository = MockShowRepository();
    usecase = GetWatchListShowStatus(mockShowRepository);
  });

  test('should get watchlist status from repository', () async {
    // arrange
    when(mockShowRepository.isAddedToWatchlistShow(1))
        .thenAnswer((_) async => true);
    // act
    final result = await usecase.execute(1);
    // assert
    expect(result, true);
  });
}
