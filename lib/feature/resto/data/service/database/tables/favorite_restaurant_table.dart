import 'package:resto/feature/resto/domain/entity/restaurant/restaurant.dart';

class FavoriteRestaurantTable {
  static final String tableName = 'favorite';
  static final String columnId = 'id';
  static final String columnName = 'name';
  static final String columnPictureId = 'pictureId';
  static final String columnCity = 'city';
  static final String columnRating = 'rating';

  static String create() {
    return "CREATE TABLE $tableName(" +
        "$columnId TEXT PRIMARY KEY," +
        "$columnName TEXT," +
        "$columnPictureId TEXT," +
        "$columnCity TEXT," +
        "$columnRating NUMERIC"
        ")";
  }

  static Map<String, dynamic> toMap(Restaurant restaurant) => {
    columnId: restaurant.id,
    columnName: restaurant.name,
    columnPictureId: restaurant.pictureId,
    columnCity: restaurant.city,
    columnRating: restaurant.rating,
  };
}
