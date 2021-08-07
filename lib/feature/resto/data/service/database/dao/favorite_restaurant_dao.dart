import 'package:resto/feature/resto/data/response/remote/restaurant/detail_restaurant_dto.dart';
import 'package:resto/feature/resto/data/service/database/database_helper.dart';
import 'package:resto/feature/resto/data/service/database/tables/favorite_restaurant_table.dart';

import '../../../../domain/entity/restaurant/detail_restaurant.dart';

class FavoriteRestaurantDao {
  final DatabaseHelper databaseHelper;

  FavoriteRestaurantDao({required this.databaseHelper});

  Future<void> insert(DetailRestaurant restaurant) async {
    final db = await databaseHelper.database;
    await db?.insert(FavoriteRestaurantTable.tableName, DetailRestaurantDto.fromDetailRestaurant(restaurant).toJson());
  }

  Future<List<DetailRestaurant>> getFavoriteRestaurants() async {
    final db = await databaseHelper.database;
    List<DetailRestaurant> list = [];
    final List<Map<String, dynamic>>? results = await db?.query(
      FavoriteRestaurantTable.tableName,
      columns: [FavoriteRestaurantTable.columnRestaurant],
    );

    if (results!.length > 0) {
      return results
          .map((data) => DetailRestaurantDto.fromJson(data[FavoriteRestaurantTable.columnRestaurant]))
          .toList();
    }

    return list;
  }

// Future<DetailRestaurant?> getRestaurant(String restaurantId) async {
//   final db = await databaseHelper.database;
//   List<Map<String, dynamic>> maps = await _db.query(FavoriteRestaurantTable.tableName,
//       columns: [FavoriteRestaurantTable.columnId, FavoriteRestaurantTable.columnRestaurant],
//       where: '${FavoriteRestaurantTable.columnId} = ?',
//       whereArgs: [restaurantId]
//   );
//
//   if(maps.length > 0){
//     return DetailRestaurantDto.fromJson(maps.first);
//   }
//   return null;
// }
}
