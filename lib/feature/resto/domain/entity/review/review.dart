import 'package:equatable/equatable.dart';

class Review extends Equatable {
  final String name;
  final String review;
  final String date;

  Review({
    required this.name,
    required this.review,
    required this.date,
  });

  @override
  List<Object?> get props => [name, review, date];
}
