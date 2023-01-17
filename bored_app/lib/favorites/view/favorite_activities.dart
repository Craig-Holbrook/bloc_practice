import 'package:bored_app/favorites/cubit/favorites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteActivities extends StatelessWidget {
  const FavoriteActivities({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = context.select((FavoritesCubit cubit) => cubit.state.favorites);
    return favorites.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Center(child: Text('You have no favorites')),
            ],
          )
        : ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final activity = favorites[index];
              return ListTile(
                title: Text(activity.name),
                subtitle: Text('${activity.type} — ${activity.participants} participant(s).'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => context.read<FavoritesCubit>().removeFavorite(index),
                ),
              );
            },
          );
  }
}
