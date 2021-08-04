import 'package:equatable/equatable.dart';
import 'package:resto/feature/resto/domain/entity/menu/drink.dart';
import 'package:resto/feature/resto/domain/entity/menu/food.dart';

class Menu extends Equatable {
  final List<Food> foods;
  final List<Drink> drinks;

  Menu({
    required this.foods,
    required this.drinks,
  });

  @override
  List<Object> get props => [foods, drinks];
}
