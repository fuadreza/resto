import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resto/core/route/main_route.dart';
import 'package:resto/feature/resto/domain/entity/restaurant/restaurant.dart';
import 'package:resto/feature/resto/presentation/bloc/favorite/favorite_restaurant_cubit.dart';
import 'package:resto/feature/resto/presentation/bloc/favorite/favorite_restaurant_state.dart';
import 'package:resto/feature/resto/presentation/widgets/item_restaurant.dart';
import 'package:resto/injection/injection.dart';

class FavoriteRestaurantPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => di<FavoriteRestaurantCubit>(),
          child: BlocConsumer<FavoriteRestaurantCubit, FavoriteRestaurantState>(
            listener: (context, state) {
              print('Favorite state: $state');
            },
            builder: (context, state) {
              if (state is Init) {
                context.read<FavoriteRestaurantCubit>().getFavoriteRestaurants();
                return Center(
                  child: Text('Loading Favorite Restaurant'),
                );
              } else if (state is Loaded) {
                return _displayOnLoadedRestaurant(context, state.restaurants);
              } else if (state is Empty) {
                return _displayOnEmptyRestaurant(context, state.message);
              } else {
                return Center(
                  child: Text('Loading Favorite Restaurant'),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _displayOnLoadedRestaurant(BuildContext context, List<Restaurant> restaurants) {
    return Container(
      margin: EdgeInsets.only(
        top: 40,
        left: 16,
        right: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Favorite Restaurant',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Text(
            'Your favorite restaurant',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: ListView(
              children: List.generate(
                restaurants.length,
                (index) {
                  return InkWell(
                    onTap: () {
                      _onRestaurantSelected(context, restaurants[index].id);
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: ItemRestaurant(restaurant: restaurants[index]),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _displayOnEmptyRestaurant(BuildContext context, String message) {
    return Container(
      margin: EdgeInsets.only(
        top: 40,
        left: 16,
        right: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Favorite Restaurant',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Text(
            'Your favorite restaurant',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: Center(
              child: Text(
                message,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _onRestaurantSelected(BuildContext context, String restaurantId) {
    goToScreen(context, DetailRestaurantPageRoute, arguments: restaurantId, afterPop: () {
      context.read<FavoriteRestaurantCubit>().getFavoriteRestaurants();
    });
  }
}
