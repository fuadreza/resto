import 'package:equatable/equatable.dart';
import 'package:resto/feature/resto/domain/entity/restaurant/detail_restaurant.dart';

abstract class DetailRestaurantState extends Equatable {
  @override
  List<Object> get props => [];
}

class Init extends DetailRestaurantState {}

class Loading extends DetailRestaurantState {}

class Error extends DetailRestaurantState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}

class Loaded extends DetailRestaurantState {
  final DetailRestaurant detailRestaurant;

  Loaded({required this.detailRestaurant});

  @override
  List<Object> get props => [detailRestaurant];
}
