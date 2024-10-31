import 'package:efash/core/utils/db/db_helper.dart';
import 'package:efash/features/products/models/product_model.dart';
import 'package:sqflite/sqflite.dart';

/// Provides CRUD operations for the `cart` table.
class CartOperations {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  /// Inserts a product into the cart, replacing it if it already exists.
  Future<void> insertCartItem(Product product) async {
    final db = await _databaseHelper.database;
    await db.insert(
      'cart',
      product.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Fetches all items from the cart.
  Future<List<Product>> getCartItems() async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('cart');
    return List.generate(maps.length, (i) => Product.fromJson(maps[i]));
  }

  /// Deletes a cart item by its ID.
  Future<void> deleteCartItem(int id) async {
    final db = await _databaseHelper.database;
    await db.delete('cart', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> clearCart() async {
    final db = await _databaseHelper.database;
    await db.delete('cart');
  }

  ///Updating cart quantity
  Future<void> updateCartQuantity(int id, int quantity) async {
    final db = await _databaseHelper.database;
    await db.update('cart', {'cart': quantity},
        where: 'id = ?', whereArgs: [id]);
  }

  Future<void> increasecartQuantity(int id) async {
    final db = await _databaseHelper.database;
    final product = await db.query('cart', where: 'id = ?', whereArgs: [id]);
    if (product.isNotEmpty) {
      final currentQuantity = product.first['cart'] as int? ?? 0;//      // Get the current quantity from the query result
      await updateCartQuantity(id, currentQuantity + 1);
    }
  }

  Future<void> decreaseCartQuantity(int id) async {
    final db = await _databaseHelper.database;
    final product = await db.query('cart', where: 'id = ?', whereArgs: [id]);
    if (product.isNotEmpty) {
      final currentQuantity = product.first['cart'] as int? ?? 0;
      if (currentQuantity > 1) {
        await updateCartQuantity(id, currentQuantity - 1);
      } else {
        await deleteCartItem(id);// delete if quantity goes below 1(1 or 0)
      }
    }
  }
}
