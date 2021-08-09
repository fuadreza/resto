import 'package:resto/feature/resto/domain/entity/category/category.dart';
import 'package:resto/feature/resto/domain/entity/menu/drink.dart';
import 'package:resto/feature/resto/domain/entity/menu/food.dart';
import 'package:resto/feature/resto/domain/entity/menu/menu.dart';
import 'package:resto/feature/resto/domain/entity/restaurant/detail_restaurant.dart';
import 'package:resto/feature/resto/domain/entity/review/review.dart';

class DetailRestaurantDto extends DetailRestaurant {
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

  DetailRestaurantDto({
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

  final picUrl = 'https://restaurant-api.dicoding.dev/images/medium/';

  factory DetailRestaurantDto.fromJson(Map<String, dynamic> json) {
    final pictureUrl = 'https://restaurant-api.dicoding.dev/images/medium/';
    return DetailRestaurantDto(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      pictureId: pictureUrl + json['pictureId'],
      city: json['name'],
      rating: json['rating'],
      menu: MenuModel.toMenu(MenuModel.fromJson(json['menus'])),
      categories: parseCategories(json['categories']),
      reviews: parseReviews(json['customerReviews']),
      isFavorite: false,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'pictureId': pictureId,
        'city': city,
        'rating': rating,
        'menus': MenuModel.fromMenu(menu).toJson(),
        'categories': List<dynamic>.from(categories.map((data) => CategoryModel.fromCategory(data).toJson())),
        'customerReviews': List<dynamic>.from(reviews.map((data) => ReviewModel.fromReview(data).toJson())),
      };

  factory DetailRestaurantDto.fromDetailRestaurant(DetailRestaurant restaurant) {
    return DetailRestaurantDto(
      id: restaurant.id,
      name: restaurant.name,
      description: restaurant.description,
      pictureId: restaurant.pictureId,
      city: restaurant.city,
      rating: restaurant.rating,
      menu: restaurant.menu,
      categories: restaurant.categories,
      reviews: restaurant.reviews,
      isFavorite: restaurant.isFavorite,
    );
  }

  static List<Category> parseCategories(json) {
    var list = json as List;
    List<Category> categories = list.map((data) => CategoryModel.toCategory(CategoryModel.fromJson(data))).toList();
    return categories;
  }

  static List<Review> parseReviews(json) {
    var list = json as List;
    List<Review> reviews = list.map((data) => ReviewModel.toReview(ReviewModel.fromJson(data))).toList();
    return reviews;
  }
}

class MenuModel extends Menu {
  final List<Food> foods;
  final List<Drink> drinks;

  MenuModel({
    required this.foods,
    required this.drinks,
  }) : super(foods: foods, drinks: drinks);

  factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
        foods: parseFoods(json['foods']),
        drinks: parseDrinks(json['drinks']),
      );

  factory MenuModel.fromMenu(Menu menu) => MenuModel(
        foods: menu.foods,
        drinks: menu.drinks,
      );

  Map<String, dynamic> toJson() => {
        'foods': List<dynamic>.from(foods.map((data) => FoodModel.fromFood(data).toJson())),
        'drinks': List<dynamic>.from(drinks.map((data) => DrinkModel.fromDrink(data).toJson())),
      };

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

  factory FoodModel.fromFood(Food food) {
    return FoodModel(name: food.name);
  }

  Map<String, dynamic> toJson() => {'name': name};

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

  factory DrinkModel.fromDrink(Drink drink) {
    return DrinkModel(name: drink.name);
  }

  Map<String, dynamic> toJson() => {'name': name};

  static Drink toDrink(DrinkModel model) {
    return Drink(
      name: model.name,
    );
  }
}

class CategoryModel extends Category {
  final String name;

  CategoryModel({required this.name}) : super(name: name);

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(name: json['name']);
  }

  factory CategoryModel.fromCategory(Category category) {
    return CategoryModel(name: category.name);
  }

  Map<String, dynamic> toJson() => {
        'name': name,
      };

  static Category toCategory(CategoryModel model) {
    return Category(name: model.name);
  }
}

class ReviewModel extends Review {
  final String name;
  final String review;
  final String date;

  ReviewModel({
    required this.name,
    required this.review,
    required this.date,
  }) : super(name: name, review: review, date: date);

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json["name"],
      review: json["review"],
      date: json["date"],
    );
  }

  factory ReviewModel.fromReview(Review review) {
    return ReviewModel(
      name: review.name,
      review: review.review,
      date: review.date,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'review': review,
        'date': date,
      };

  static Review toReview(ReviewModel model) {
    return Review(
      name: model.name,
      review: model.review,
      date: model.date,
    );
  }
}
