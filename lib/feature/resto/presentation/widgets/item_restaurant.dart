import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:resto/feature/resto/domain/entity/restaurant/restaurant.dart';

class ItemRestaurant extends StatelessWidget {
  final Restaurant restaurant;

  ItemRestaurant({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              restaurant.pictureId,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 8,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  restaurant.name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('📍 ${restaurant.city}'),
                SizedBox(
                  height: 8,
                ),
                Text('★ ${restaurant.rating}'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
