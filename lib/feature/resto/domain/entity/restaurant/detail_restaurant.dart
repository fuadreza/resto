import 'package:equatable/equatable.dart';
import 'package:resto/feature/resto/domain/entity/menu/menu.dart';

class DetailRestaurant extends Equatable {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final num rating;
  final Menu menu;

  DetailRestaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menu,
  });

  @override
  List<Object> get props => [id, name, description, pictureId, city, rating, menu];
}
