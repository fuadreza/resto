import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resto/core/route/main_route.dart';
import 'package:resto/feature/resto/presentation/bloc/detail/detail_restaurant_cubit.dart';
import 'package:resto/feature/resto/presentation/bloc/detail/detail_restaurant_state.dart';
import 'package:resto/feature/resto/presentation/widgets/item_menu.dart';
import 'package:resto/injection/injection.dart';

class DetailRestaurantPage extends StatelessWidget {
  final String restaurantId;

  DetailRestaurantPage({required this.restaurantId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (_) => di<DetailRestaurantCubit>(),
          child: BlocConsumer<DetailRestaurantCubit, DetailRestaurantState>(
            listener: (context, state) {
              print('state');
            },
            builder: (context, state) {
              if (state is Init) {
                context.read<DetailRestaurantCubit>().getDetailRestaurant(restaurantId);
                return Center(
                  child: Text('Loading Detail'),
                );
              } else if (state is Error) {
                return Center(
                  child: Text('Error: ${state.message}'),
                );
              } else if (state is Loaded) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            child: Image.network(
                              state.detailRestaurant.pictureId,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 16,
                            left: 16,
                            child: InkWell(
                              onTap: () {
                                goBack(context);
                              },
                              child: Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white.withOpacity(0.9),
                                ),
                                child: Icon(Icons.arrow_back),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                        child: Text(
                          state.detailRestaurant.name + ' ★ ${state.detailRestaurant.rating}',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Text('📍 ${state.detailRestaurant.city}'),
                      ),
                      SizedBox(height: 20),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Description',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20, top: 8),
                        child: Text('${state.detailRestaurant.description}'),
                      ),
                      SizedBox(height: 20),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Menus',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                        child: Text(
                          'Food',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Container(
                        height: 140,
                        margin: EdgeInsets.only(left: 20),
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: state.detailRestaurant.menu.foods.length,
                          itemBuilder: (context, index) {
                            return ItemMenu(
                              menuName: state.detailRestaurant.menu.foods[index].name,
                            );
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20, bottom: 4, top: 16),
                        child: Text(
                          'Drink',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Container(
                        height: 140,
                        margin: EdgeInsets.only(left: 20),
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: state.detailRestaurant.menu.drinks.length,
                          itemBuilder: (context, index) {
                            return ItemMenu(
                              menuName: state.detailRestaurant.menu.drinks[index].name,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
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
    );
  }
}
