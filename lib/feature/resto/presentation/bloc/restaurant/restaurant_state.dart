import 'package:equatable/equatable.dart';
import 'package:resto/feature/resto/domain/entity/restaurant/restaurant.dart';

abstract class RestaurantState extends Equatable {
  @override
  List<Object> get props => [];
}

class Init extends RestaurantState {}

class Loading extends RestaurantState {}

class Error extends RestaurantState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}

class Loaded extends RestaurantState {
  final List<Restaurant> restaurants;

  Loaded({required this.restaurants});

  @override
  List<Object> get props => [restaurants];
}
