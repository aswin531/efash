import 'package:efash/core/utils/db/db_helper.dart';
import 'package:efash/features/products/models/product_model.dart';
import 'package:sqflite/sqflite.dart';

class WatchlistDbHelper {
  final DatabaseHelper databaseHelper = DatabaseHelper();

  Future<void> addToWatchList(Product productlocal) async {
    final db = await databaseHelper.database;
    await db.insert('watchList', productlocal.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Product>> getWatchlistItem() async {
    try {
      final db = await databaseHelper.database;
      final List<Map<String, dynamic>> maps = await db.query('watchlist');
      print("=============Retrieved watchlist items: $maps");

      return List.generate(maps.length, (i) {
        try {
          return Product.fromJson(maps[i]);
        } catch (e) {
          print("Error parsing product at index $i: $e");
          print("Product data: ${maps[i]}");
          rethrow;
        }
      });
    } catch (e) {
      print("Error in getWatchlistItem: $e");
      rethrow;
    }
  }

  Future<void> removeFromWatchlist(int id) async {
    final db = await databaseHelper.database;
    await db.delete('watchlist', where: 'id = ?', whereArgs: [id]);
  }

  Future<bool> isProductInWatchlist(int id) async {
    final db = await databaseHelper.database;
    final List<Map<String, dynamic>> result = await db.query(
      'watchlist',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    print('result from db: $result');
    return result.isNotEmpty;
  }
}
