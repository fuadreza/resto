
import 'package:equatable/equatable.dart';
import 'package:resto/feature/resto/domain/entity/restaurant/restaurant.dart';

abstract class FavoriteRestaurantState extends Equatable {
  @override
  List<Object> get props => [];
}

class Init extends FavoriteRestaurantState {}

class Loading extends FavoriteRestaurantState {}

class Error extends FavoriteRestaurantState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}

class Loaded extends FavoriteRestaurantState {
  final List<Restaurant> restaurants;

  Loaded({required this.restaurants});

  @override
  List<Object> get props => [restaurants];
}