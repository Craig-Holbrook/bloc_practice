import 'package:bored_app/activities/cubit/activities_cubit.dart';
import 'package:bored_app/activities/repositories/activities_repository.dart';
import 'package:bored_app/activities/view/activities_screen.dart';
import 'package:bored_app/favorites/cubit/favorites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    final favoritesCubit = FavoritesCubit();
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => ActivitiesCubit(
                  activitiesRepository: ActivitiesRepository(),
                ),
              ),
              BlocProvider.value(
                value: favoritesCubit,
              ),
            ],
            child: const ActivitiesScreen(),
          ),
        );
      default:
        return null;
    }
  }
}
