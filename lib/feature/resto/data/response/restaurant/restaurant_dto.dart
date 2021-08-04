import 'package:resto/feature/resto/domain/entity/restaurant/restaurant.dart';

class RestaurantDto {
  final List<Restaurant> restaurants;

  RestaurantDto({required this.restaurants});

  factory RestaurantDto.fromJson(Map<String, dynamic> json) {
    return RestaurantDto(restaurants: parseRestaurants(json['restaurants']));
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
  final String description;
  final String pictureId;
  final String city;
  final double rating;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  }) : super(id: id, name: name, description: description, pictureId: pictureId, city: city, rating: rating);

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      pictureId: json['pictureId'],
      city: json['city'],
      rating: json['rating'],
    );
  }

  static Restaurant toRestaurant(RestaurantModel dto) {
    return Restaurant(
      id: dto.id,
      name: dto.name,
      description: dto.description,
      pictureId: dto.pictureId,
      city: dto.city,
      rating: dto.rating,
    );
  }
}