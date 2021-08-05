
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;

  Category({required this.name});

  @override
  List<Object?> get props => [name];
}