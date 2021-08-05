import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:resto/core/theme/app_colors.dart';
import 'package:resto/feature/resto/domain/entity/review/review.dart';

class ItemReview extends StatelessWidget {
  final Review review;

  ItemReview({required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 4),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.grey,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            review.name,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            review.date,
            style: TextStyle(
              fontSize: 12,
              color: AppColors.primary,
            ),
          ),
          SizedBox(height: 10),
          Text(
            review.review,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
