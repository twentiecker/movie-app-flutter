import 'package:ditonton_flutter/domain/repositories/show_repository.dart';

class GetWatchListShowStatus {
  final ShowRepository repository;

  GetWatchListShowStatus(this.repository);

  Future<bool> execute(int id) async {
    return repository.isAddedToWatchlistShow(id);
  }
}
