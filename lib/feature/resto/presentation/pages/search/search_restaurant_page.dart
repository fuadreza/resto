import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resto/core/route/main_route.dart';
import 'package:resto/core/theme/app_colors.dart';
import 'package:resto/feature/resto/presentation/bloc/search/search_restaurant_cubit.dart';
import 'package:resto/feature/resto/presentation/bloc/search/search_restaurant_state.dart';
import 'package:resto/feature/resto/presentation/widgets/item_restaurant.dart';
import 'package:resto/feature/resto/presentation/widgets/search_bar.dart';
import 'package:resto/injection/injection.dart';

class SearchRestaurantPage extends StatelessWidget {
  var _context;

  @override
  Widget build(BuildContext context) {
    _context = context;

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
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        goBack(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 8),
                        padding: EdgeInsets.all(4),
                        child: Icon(Icons.arrow_back),
                      ),
                    ),
                    Text(
                      'Search',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ],
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
                                  state.restaurants.length,
                                  (index) {
                                    return InkWell(
                                      onTap: () {
                                        _onRestaurantSelected(state.restaurants[index].id);
                                      },
                                      borderRadius: BorderRadius.circular(10),
                                      child: ItemRestaurant(restaurant: state.restaurants[index]),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        );
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

  _onRestaurantSelected(String restaurantId) {
    goToScreen(_context, DetailRestaurantPageRoute, arguments: restaurantId);
  }
}
