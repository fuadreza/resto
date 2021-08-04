import 'package:equatable/equatable.dart';

class Food extends Equatable {
  final String name;

  Food({required this.name});

  @override
  List<Object> get props => [name];
}
