import 'package:equatable/equatable.dart';

class Drink extends Equatable {
  final String name;

  Drink({required this.name});

  @override
  List<Object> get props => [name];
}
