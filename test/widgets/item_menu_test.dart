import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../lib/feature/resto/presentation/widgets/item_menu.dart';

Widget createItemMenu() => MaterialApp(
      home: Container(
        child: ItemMenu(menuName: 'Beef'),
      ),
    );

void main() {
  group('Item Menu test', () {
    testWidgets('Testing if Icon shows up', (WidgetTester tester) async {
      await tester.pumpWidget(createItemMenu());
      expect(find.byType(Icon), findsOneWidget);
    });

    testWidgets('Testing if Text shows up', (WidgetTester tester) async {
      await tester.pumpWidget(createItemMenu());
      expect(find.byType(Text), findsOneWidget);
    });
  });
}
