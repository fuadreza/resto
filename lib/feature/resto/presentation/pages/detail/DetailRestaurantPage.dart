import 'package:flutter/widgets.dart';

class DetailRestaurantPage extends StatelessWidget {
  final String restaurantId;

  DetailRestaurantPage({required this.restaurantId});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Detail Page'));
  }
}
