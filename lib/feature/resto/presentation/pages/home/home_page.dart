import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resto/core/route/main_route.dart';
import 'package:resto/core/theme/app_colors.dart';
import 'package:resto/feature/resto/presentation/bloc/restaurant/restaurant_cubit.dart';
import 'package:resto/feature/resto/presentation/bloc/restaurant/restaurant_state.dart';
import 'package:resto/feature/resto/presentation/widgets/item_restaurant.dart';
import 'package:resto/injection/injection.dart';

class HomePage extends StatelessWidget {
  var _context;

  @override
  Widget build(BuildContext context) {
    _context = context;

    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (_) => di<RestaurantCubit>(),
          child: BlocConsumer<RestaurantCubit, RestaurantState>(
            listener: (context, state) {
              print('state');
            },
            builder: (context, state) {
              if (state is Init) {
                context.read<RestaurantCubit>().getRestaurants();
                return Center(
                  child: Text('Loading Restaurant'),
                );
              } else if (state is Loaded) {
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
                        'Restaurant',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        'Recommendation restaurants for you!',
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
                  ),
                );
              } else if (state is Error) {
                return Center(
                  child: Text('Error: ${state.message}'),
                );
              } else {
                return Center(
                  child: Text('Empty'),
                );
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          goToScreen(_context, SearchRestaurantPageRoute);
        },
        child: Icon(
          Icons.search,
          color: AppColors.black,
        ),
        backgroundColor: AppColors.white,
      ),
    );
  }

  _onRestaurantSelected(String restaurantId) {
    goToScreen(_context, DetailRestaurantPageRoute, arguments: restaurantId);
  }
}
