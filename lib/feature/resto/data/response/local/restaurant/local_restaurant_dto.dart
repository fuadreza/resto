import 'package:resto/feature/resto/domain/entity/restaurant/restaurant.dart';

class LocalRestaurantDto {
  final List<Restaurant> restaurants;

  LocalRestaurantDto({required this.restaurants});

  factory LocalRestaurantDto.fromJson(Map<String, dynamic> json) {
    return LocalRestaurantDto(restaurants: parseRestaurants(json['restaurants']));
  }

  static List<Restaurant> parseRestaurants(json){
    var list = json as List;
    List<Restaurant> restaurants = list.map((data) => RestaurantModel.toRestaurant(RestaurantModel.fromJson(data))).toList();
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
    return Restaurant(
      id: dto.id,
      name: dto.name,
      pictureId: dto.pictureId,
      city: dto.city,
      rating: dto.rating,
    );
  }
}