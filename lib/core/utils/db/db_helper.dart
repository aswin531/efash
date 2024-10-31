import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/// Manages the database connection using a Singleton pattern.
class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  /// Returns the single instance of DatabaseHelper.
  factory DatabaseHelper() => _instance;

  // Private constructor to create the instance.
  DatabaseHelper._internal();

  /// Getter for database, initializes it if not already created.
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  /// Sets up the database and initial tables.
  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'ecommerce.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE cart(
          id INTEGER PRIMARY KEY,
          slug TEXT,
          code TEXT,
          name TEXT,
          price REAL,
          oldprice REAL,
          image TEXT,
          wishlist INTEGER,
          cart INTEGER,
          store TEXT,
          manufacturer TEXT
        )
        ''');

        await db.execute('''
        CREATE TABLE watchlist(
          id INTEGER PRIMARY KEY,
          slug TEXT,
          code TEXT,
          name TEXT,
          price REAL,
          oldprice REAL,
          image TEXT,
          wishlist INTEGER,
          cart INTEGER,
          store TEXT,
          manufacturer TEXT
        )
        ''');
      },
    );
  }
}
