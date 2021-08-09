import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resto/core/route/main_route.dart';
import 'package:resto/core/theme/app_colors.dart';
import 'package:resto/core/utils/connectivity_util.dart';
import 'package:resto/feature/resto/presentation/bloc/restaurant/restaurant_cubit.dart';
import 'package:resto/feature/resto/presentation/bloc/restaurant/restaurant_state.dart';
import 'package:resto/feature/resto/presentation/widgets/item_restaurant.dart';
import 'package:resto/injection/injection.dart';

class RestaurantPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (_) => di<RestaurantCubit>(),
          child: Column(
            children: [
              connectivity.isConnected
                  ? SizedBox()
                  : Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 8),
                      color: AppColors.danger,
                      child: Text(
                        'Not connected to internet',
                        textAlign: TextAlign.center,
                      ),
                    ),
              Expanded(
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
                                        _onRestaurantSelected(context, state.restaurants[index].id);
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
            ],
          ),
        ),
      ),
    );
  }

  _onRestaurantSelected(BuildContext context, String restaurantId) {
    goToScreen(context, DetailRestaurantPageRoute, arguments: restaurantId);
  }
}
