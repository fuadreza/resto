
import 'dart:convert';

import 'package:resto/feature/resto/data/response/restaurant/restaurant_dto.dart';
import 'package:flutter/services.dart' show rootBundle;

abstract class RestaurantLocalDataSource {
  Future<RestaurantDto> getRestaurants();
}

class RestaurantLocalDataSourceImpl implements RestaurantLocalDataSource{
  @override
  Future<RestaurantDto> getRestaurants() async{
    var localJson = json.decode(await getJson());
    return RestaurantDto.fromJson(localJson);
  }

  Future<String> getJson(){
    return rootBundle.loadString('local_restaurants.json');
  }

}