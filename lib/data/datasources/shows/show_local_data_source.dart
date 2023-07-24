import 'package:ditonton_flutter/common/exception.dart';
import 'package:ditonton_flutter/data/datasources/db/database_helper.dart';
import 'package:ditonton_flutter/data/models/shows/show_table.dart';

abstract class ShowLocalDataSource {
  Future<String> insertWatchlist(ShowTable show);

  Future<String> removeWatchlist(ShowTable show);

  Future<ShowTable?> getShowById(int id);

  Future<List<ShowTable>> getWatchlistShows();
}

class ShowLocalDataSourceImpl implements ShowLocalDataSource {
  final DatabaseHelper databaseHelper;

  ShowLocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<String> insertWatchlist(ShowTable show) async {
    try {
      await databaseHelper.insertWatchlistShow(show);
      return 'Added to Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> removeWatchlist(ShowTable show) async {
    try {
      await databaseHelper.removeWatchlistShow(show);
      return 'Removed from Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<ShowTable?> getShowById(int id) async {
    final result = await databaseHelper.getShowById(id);
    if (result != null) {
      return ShowTable.fromMap(result);
    } else {
      return null;
    }
  }

  @override
  Future<List<ShowTable>> getWatchlistShows() async {
    final result = await databaseHelper.getWatchlistShows();
    return result.map((data) => ShowTable.fromMap(data)).toList();
  }
}
