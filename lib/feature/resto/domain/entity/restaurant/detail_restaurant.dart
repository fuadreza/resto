import 'package:equatable/equatable.dart';
import 'package:resto/feature/resto/domain/entity/category/category.dart';
import 'package:resto/feature/resto/domain/entity/menu/menu.dart';
import 'package:resto/feature/resto/domain/entity/review/review.dart';

class DetailRestaurant extends Equatable {
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

  DetailRestaurant({
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
  });

  @override
  List<Object> get props => [id, name, description, pictureId, city, rating, menu, categories, reviews, isFavorite];
}
