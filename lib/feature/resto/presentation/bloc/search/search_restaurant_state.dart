import 'package:equatable/equatable.dart';
import 'package:resto/feature/resto/domain/entity/restaurant/restaurant.dart';

abstract class SearchRestaurantState extends Equatable {
  @override
  List<Object> get props => [];
}

class Init extends SearchRestaurantState {}

class Loading extends SearchRestaurantState {}

class Error extends SearchRestaurantState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}

class Loaded extends SearchRestaurantState {
  final List<Restaurant> restaurants;

  Loaded({required this.restaurants});

  @override
  List<Object> get props => [restaurants];
}

class Empty extends SearchRestaurantState {
  final String message;

  Empty({required this.message});

  @override
  List<Object> get props => [message];
}