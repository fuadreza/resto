import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resto/feature/resto/presentation/bloc/restaurant_cubit.dart';
import 'package:resto/feature/resto/presentation/bloc/restaurant_state.dart';
import 'package:resto/injection/injection.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (_) => di<RestaurantCubit>(),
          child: BlocConsumer<RestaurantCubit, RestaurantState>(listener: (context, state) {
            print('state');
          }, builder: (context, state) {
            if (state is Init) {
              context.read<RestaurantCubit>().getRestaurants();
              return Center(
                child: Text('Loading'),
              );
            } else if (state is Loaded) {
              return Center(
                child: Text('Data: ${state.restaurants}'),
              );
            } else {
              return Center(
                child: Text('Empty'),
              );
            }
          }),
        ),
      ),
    );
  }
}
