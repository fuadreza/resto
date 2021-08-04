import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:resto/core/utils/menu_type.dart';

class ItemMenu extends StatelessWidget {
  final String menuName;
  final MenuType type;

  ItemMenu({
    required this.menuName,
    this.type = MenuType.FOOD,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Wrap(
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[300],
            ),
            child: Center(
              child: Icon(
                type == MenuType.FOOD ? Icons.fastfood : Icons.emoji_food_beverage,
              ),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Container(
            width: 100,
            child: Text(menuName),
          ),
        ],
      ),
    );
  }
}
