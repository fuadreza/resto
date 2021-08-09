import 'package:resto/feature/resto/domain/entity/category/category.dart';
import 'package:resto/feature/resto/domain/entity/menu/drink.dart';
import 'package:resto/feature/resto/domain/entity/menu/food.dart';
import 'package:resto/feature/resto/domain/entity/menu/menu.dart';
import 'package:resto/feature/resto/domain/entity/restaurant/detail_restaurant.dart';
import 'package:resto/feature/resto/domain/entity/review/review.dart';

class LocalDetailRestaurantDto {
  final List<DetailRestaurant> restaurants;

  LocalDetailRestaurantDto({required this.restaurants});

  factory LocalDetailRestaurantDto.fromJson(Map<String, dynamic> json) {
    return LocalDetailRestaurantDto(restaurants: parseRestaurants(json['restaurants']));
  }

  static List<DetailRestaurant> parseRestaurants(json) {
    var list = json as List;
    List<DetailRestaurant> restaurants =
        list.map((data) => DetailRestaurantModel.toDetailRestaurant(DetailRestaurantModel.fromJson(data))).toList();
    return restaurants;
  }
}

class DetailRestaurantModel extends DetailRestaurant {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final num rating;
  final Menu menu;
  final List<Category> categories;
  final List<Review> reviews;
  final bool isFavorite;

  DetailRestaurantModel({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menu,
    required this.categories,
    required this.reviews,
    required this.isFavorite,
  }) : super(
          id: id,
          name: name,
          description: description,
          pictureId: pictureId,
          city: city,
          rating: rating,
          menu: menu,
          categories: categories,
          reviews: reviews,
          isFavorite: isFavorite,
        );

  factory DetailRestaurantModel.fromJson(Map<String, dynamic> json) {
    return DetailRestaurantModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      pictureId: json['pictureId'],
      city: json['city'],
      rating: json['rating'],
      menu: MenuModel.toMenu(MenuModel.fromJson(json['menus'])),
      categories: [],
      reviews: [],
      isFavorite: false,
    );
  }

  static DetailRestaurant toDetailRestaurant(DetailRestaurantModel model) {
    return DetailRestaurant(
      id: model.id,
      name: model.name,
      description: model.description,
      pictureId: model.pictureId,
      city: model.city,
      rating: model.rating,
      menu: model.menu,
      categories: model.categories,
      reviews: model.reviews,
      isFavorite: model.isFavorite,
    );
  }
}

class MenuModel extends Menu {
  final List<Food> foods;
  final List<Drink> drinks;

  MenuModel({
    required this.foods,
    required this.drinks,
  }) : super(foods: foods, drinks: drinks);

  factory MenuModel.fromJson(Map<String, dynamic> json) {
    return MenuModel(
      foods: parseFoods(json['foods']),
      drinks: parseDrinks(json['drinks']),
    );
  }

  static Menu toMenu(MenuModel model) {
    return Menu(
      foods: model.foods,
      drinks: model.drinks,
    );
  }

  static List<Food> parseFoods(json) {
    var list = json as List;
    List<Food> foods = list.map((data) => FoodModel.toFood(FoodModel.fromJson(data))).toList();
    return foods;
  }

  static List<Drink> parseDrinks(json) {
    var list = json as List;
    List<Drink> drinks = list.map((data) => DrinkModel.toDrink(DrinkModel.fromJson(data))).toList();
    return drinks;
  }
}

class FoodModel extends Food {
  final String name;

  FoodModel({required this.name}) : super(name: name);

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(name: json['name']);
  }

  static Food toFood(FoodModel model) {
    return Food(
      name: model.name,
    );
  }
}

class DrinkModel extends Drink {
  final String name;

  DrinkModel({required this.name}) : super(name: name);

  factory DrinkModel.fromJson(Map<String, dynamic> json) {
    return DrinkModel(
      name: json['name'],
    );
  }

  static Drink toDrink(DrinkModel model) {
    return Drink(
      name: model.name,
    );
  }
}
