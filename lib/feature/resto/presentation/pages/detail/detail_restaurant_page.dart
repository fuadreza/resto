import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resto/feature/resto/presentation/bloc/detail/detail_restaurant_cubit.dart';
import 'package:resto/feature/resto/presentation/bloc/detail/detail_restaurant_state.dart';
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
              } else if (state is Loaded) {
                return Center(
                  child: Text('Data: ${state.detailRestaurant}'),
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
    );
  }
}
