import 'package:resto/feature/resto/domain/entity/restaurant/restaurant.dart';

class RestaurantDto {
  final List<Restaurant> restaurants;
  final num count;

  RestaurantDto({required this.restaurants, required this.count});

  factory RestaurantDto.fromJson(Map<String, dynamic> json) {
    return RestaurantDto(
      restaurants: parseRestaurants(json['restaurants']),
      count: json['count'] != null ? json['count'] : 0,
    );
  }

  static List<Restaurant> parseRestaurants(json) {
    var list = json as List;
    List<Restaurant> restaurants =
        list.map((data) => RestaurantModel.toRestaurant(RestaurantModel.fromJson(data))).toList();
    return restaurants;
  }
}

class RestaurantModel extends Restaurant {
  final String id;
  final String name;
  final String pictureId;
  final String city;
  final num rating;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.pictureId,
    required this.city,
    required this.rating,
  }) : super(id: id, name: name, pictureId: pictureId, city: city, rating: rating);

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      id: json['id'],
      name: json['name'],
      pictureId: json['pictureId'],
      city: json['city'],
      rating: json['rating'],
    );
  }

  static Restaurant toRestaurant(RestaurantModel dto) {
    final pictureUrl = 'https://restaurant-api.dicoding.dev/images/medium/';
    return Restaurant(
      id: dto.id,
      name: dto.name,
      pictureId: pictureUrl + dto.pictureId,
      city: dto.city,
      rating: dto.rating,
    );
  }
}
