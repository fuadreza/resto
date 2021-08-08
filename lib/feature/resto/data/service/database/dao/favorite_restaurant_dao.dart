import 'dart:developer';

import 'package:resto/feature/resto/data/response/remote/restaurant/restaurant_dto.dart';
import 'package:resto/feature/resto/data/service/database/database_helper.dart';
import 'package:resto/feature/resto/data/service/database/tables/favorite_restaurant_table.dart';
import 'package:resto/feature/resto/domain/entity/restaurant/restaurant.dart';
import 'package:sqflite/sqflite.dart';

class FavoriteRestaurantDao {
  final DatabaseHelper databaseHelper;

  FavoriteRestaurantDao({required this.databaseHelper});

  Future<void> insert(Restaurant restaurant) async {
    final db = await databaseHelper.database;
    try {
      await db?.insert(FavoriteRestaurantTable.tableName, FavoriteRestaurantTable.toMap(restaurant),
          conflictAlgorithm: ConflictAlgorithm.replace);
    } on Exception catch (e) {
      log('ERROR: $e');
    }
  }

  Future<List<Restaurant>> getFavoriteRestaurants() async {
    final db = await databaseHelper.database;
    final List<Map<String, dynamic>>? results = await db?.query(
      FavoriteRestaurantTable.tableName,
      columns: [
        FavoriteRestaurantTable.columnId,
        FavoriteRestaurantTable.columnName,
        FavoriteRestaurantTable.columnPictureId,
        FavoriteRestaurantTable.columnCity,
        FavoriteRestaurantTable.columnRating,
      ],
    );

    if (results!.length > 0) {
      return results.map((data) => RestaurantModel.fromJson(data)).toList();
    }

    return [];
  }
}
