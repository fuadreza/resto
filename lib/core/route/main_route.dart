
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:resto/feature/resto/presentation/pages/detail/DetailRestaurantPage.dart';
import 'package:resto/feature/resto/presentation/pages/home/home_page.dart';

const String HomePageRoute = '/';
const String DetailRestaurantPageRoute = 'detail';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomePageRoute:
      return MaterialPageRoute(builder: (context) => HomePage());
    case DetailRestaurantPageRoute:
      final restaurantId = settings.arguments as String;
      return MaterialPageRoute(builder: (context) => DetailRestaurantPage(restaurantId: restaurantId));
    default:
      return MaterialPageRoute(builder: (context) => HomePage());
  }
}

void goToScreen(BuildContext context, String route, {dynamic arguments}){
  if(arguments != null){
    Navigator.pushNamed(context, route, arguments: arguments);
  }else {
    Navigator.pushNamed(context, route);
  }
}