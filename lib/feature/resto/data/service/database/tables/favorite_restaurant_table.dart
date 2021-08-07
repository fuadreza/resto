class FavoriteRestaurantTable {
  static final String tableName = 'favorite';
  static final String columnId = '_id';
  static final String columnRestaurant = 'restaurant';

  static String create() {
    return "CREATE TABLE $tableName(" + "$columnId TEXT PRIMARY KEY," + "$columnRestaurant TEXT" + ")";
  }
}
