import 'package:resto/feature/resto/data/service/database/tables/favorite_restaurant_table.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _instance;
  static Database? _database;

  DatabaseHelper._internal() {
    _instance = this;
  }

  factory DatabaseHelper() => _instance ?? DatabaseHelper._internal();

  Future<Database?> get database async {
    if (_database == null) {
      _database = await _initializeDb();
    }

    return _database;
  }

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      '$path/restaurant.db',
      onCreate: (db, version) async {
        await db.execute(FavoriteRestaurantTable.create());
      },
      version: 1,
    );

    return db;
  }

  static close() async {
    await _database?.close();
  }
}
