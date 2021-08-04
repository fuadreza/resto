

import 'package:equatable/equatable.dart';
import 'package:resto/feature/resto/domain/entity/restaurant/restaurant.dart';

abstract class RestaurantState extends Equatable {
  @override
  List<Object> get props => [];
}

class Init extends RestaurantState {}

class Loading extends RestaurantState {}

class Loaded extends RestaurantState {
  final List<Restaurant> restaurants;

  Loaded({required this.restaurants});

  @override
  List<Object> get props => [restaurants];
}