import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:resto/feature/resto/domain/entity/review/review.dart';

import '../../lib/feature/resto/presentation/widgets/item_review.dart';

final review = Review(name: 'Aldo', review: 'Nice movie', date: '12 Agustus 2021');

Widget createItemRestaurant() => MaterialApp(
      home: Container(
        child: ItemReview(
          review: review,
        ),
      ),
    );

void main() {
  group('Item Review test', () {
    testWidgets('Testing if Text shows up', (WidgetTester tester) async {
      await tester.pumpWidget(createItemRestaurant());
      expect(find.byType(Text), findsNWidgets(3));
    });
  });
}
