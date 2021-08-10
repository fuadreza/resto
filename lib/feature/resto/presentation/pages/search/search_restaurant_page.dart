import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resto/core/route/main_route.dart';
import 'package:resto/core/route/navigation_service.dart';
import 'package:resto/core/theme/app_colors.dart';
import 'package:resto/feature/resto/domain/entity/restaurant/restaurant.dart';
import 'package:resto/feature/resto/presentation/bloc/search/search_restaurant_cubit.dart';
import 'package:resto/feature/resto/presentation/bloc/search/search_restaurant_state.dart';
import 'package:resto/feature/resto/presentation/widgets/item_restaurant.dart';
import 'package:resto/feature/resto/presentation/widgets/search_bar.dart';
import 'package:resto/injection/injection.dart';

class SearchRestaurantPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => di<SearchRestaurantCubit>(),
          child: Container(
            margin: EdgeInsets.only(
              top: 40,
              left: 16,
              right: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Search',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: BlocConsumer<SearchRestaurantCubit, SearchRestaurantState>(
                    listener: (context, state) {
                      print('state');
                    },
                    builder: (context, state) {
                      if (state is Init) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SearchBar(
                              onSubmit: (data) {
                                context.read<SearchRestaurantCubit>().searchRestaurant(data);
                              },
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Expanded(
                              child: Center(
                                child: Text('Type something'),
                              ),
                            ),
                          ],
                        );
                      } else if (state is Loading) {
                        return Column(
                          children: [
                            SearchBar(
                              onSubmit: (data) {
                                context.read<SearchRestaurantCubit>().searchRestaurant(data);
                              },
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Expanded(
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.search,
                                      size: 96,
                                      color: AppColors.darkGrey,
                                    ),
                                    Text(
                                      'Finding restaurant for you',
                                      style: TextStyle(
                                        color: AppColors.darkGrey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      } else if (state is Loaded) {
                        return _displayOnRestaurantsFound(context, state.restaurants);
                      } else if (state is Empty) {
                        return _displayOnRestaurantsNotFound(context, state.message);
                      } else if (state is Error) {
                        return Column(
                          children: [
                            SearchBar(
                              onSubmit: (data) {
                                context.read<SearchRestaurantCubit>().searchRestaurant(data);
                              },
                            ),
                            Expanded(
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.no_food,
                                      size: 96,
                                      color: AppColors.darkGrey,
                                    ),
                                    SizedBox(height: 16),
                                    Text(
                                      state.message,
                                      style: TextStyle(
                                        color: AppColors.darkGrey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Center(
                          child: Text('Empty'),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _displayOnRestaurantsFound(BuildContext context, List<Restaurant> restaurants) {
    return Column(
      children: [
        SearchBar(
          onSubmit: (data) {
            context.read<SearchRestaurantCubit>().searchRestaurant(data);
          },
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
    );
  }

  Widget _displayOnRestaurantsNotFound(BuildContext context, String message){
    return Column(
      children: [
        SearchBar(
          onSubmit: (data) {
            context.read<SearchRestaurantCubit>().searchRestaurant(data);
          },
        ),
        SizedBox(
          height: 16,
        ),
        Expanded(
          child: Center(
            child: Text(message),
          ),
        ),
      ],
    );
  }

  _onRestaurantSelected(BuildContext context, String restaurantId) {
    NavigationService.navigateTo(DetailRestaurantPageRoute, arguments: restaurantId);
  }
}
