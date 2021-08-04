import 'package:equatable/equatable.dart';

class Restaurant extends Equatable {
  final String id;
  final String name;
  final String pictureId;
  final String city;
  final num rating;

  Restaurant({
    required this.id,
    required this.name,
    required this.pictureId,
    required this.city,
    required this.rating,
  });

  @override
  List<Object> get props => [id, name, pictureId, city, rating];
}
