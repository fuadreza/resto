import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resto/core/route/navigation_service.dart';
import 'package:resto/core/theme/app_colors.dart';
import 'package:resto/feature/resto/presentation/bloc/detail/detail_restaurant_cubit.dart';
import 'package:resto/feature/resto/presentation/bloc/detail/detail_restaurant_state.dart';
import 'package:resto/feature/resto/presentation/widgets/item_menu.dart';
import 'package:resto/feature/resto/presentation/widgets/item_review.dart';
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
                        clipBehavior: Clip.none,
                        children: [
                          Container(height: 350,width: MediaQuery.of(context).size.width),
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            child: Hero(
                              tag: state.detailRestaurant.pictureId,
                              child: Image.network(
                                state.detailRestaurant.pictureId,
                                height: 320,
                                fit: BoxFit.cover,
                                errorBuilder: (_, error, stackTrace) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 200,
                                    color: AppColors.secondary,
                                    child: Center(
                                      child: Icon(Icons.restaurant),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Positioned(
                            top: 16,
                            left: 16,
                            child: InkWell(
                              onTap: () {
                                NavigationService.back();
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
                          Positioned(
                            bottom: 0,
                            right: 16,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  context.read<DetailRestaurantCubit>().setFavoriteRestaurant(state.detailRestaurant);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: state.detailRestaurant.isFavorite
                                      ? Icon(
                                          Icons.favorite,
                                          size: 40,
                                          color: Colors.redAccent,
                                        )
                                      : Icon(
                                          Icons.favorite_border,
                                          size: 40,
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20, bottom: 16),
                        child: Text(
                          state.detailRestaurant.name + ' ??? ${state.detailRestaurant.rating}',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Text('???? ${state.detailRestaurant.city}'),
                      ),
                      SizedBox(height: 20),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Categories',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        margin: EdgeInsets.only(left: 20),
                        child: state.detailRestaurant.categories.length != 0
                            ? ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: state.detailRestaurant.categories.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.only(right: 4),
                                    child: Chip(
                                      label: Text(state.detailRestaurant.categories[index].name),
                                    ),
                                  );
                                },
                              )
                            : Text('Undefined'),
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
                      SizedBox(height: 20),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Reviews',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: state.detailRestaurant.reviews.length,
                          itemBuilder: (context, index) {
                            return ItemReview(
                              review: state.detailRestaurant.reviews[index],
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
