import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:resto/feature/resto/domain/entity/restaurant/restaurant.dart';

import '../../lib/feature/resto/presentation/widgets/item_restaurant.dart';

final restaurant = Restaurant(id: 'abc', name: 'Kafe', pictureId: 'pictureId', city: 'Mean', rating: 4.0);

Widget createItemRestaurant() => MaterialApp(
      home: Container(
        child: ItemRestaurant(
          restaurant: restaurant,
        ),
      ),
    );

void main() {
  group('Item Restaurant test', () {
    testWidgets('Testing if Image shows up', (WidgetTester tester) async {
      await tester.pumpWidget(createItemRestaurant());
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('Testing if Text shows up', (WidgetTester tester) async {
      await tester.pumpWidget(createItemRestaurant());
      expect(find.byType(Text), findsNWidgets(3));
    });
  });
}
