import 'package:bored_app/favorites/cubit/favorites_cubit.dart';
import 'package:bored_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteActivities extends StatelessWidget {
  const FavoriteActivities({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final favorites = context.select((FavoritesCubit cubit) => cubit.state.favorites);
    return favorites.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(child: Text(l10n.noFavoritesFeedback)),
            ],
          )
        : ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final activity = favorites[index];
              return ListTile(
                title: Text(activity.name),
                subtitle: Text('${activity.type} — ${activity.participants} ${l10n.participants}.'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () => context.read<FavoritesCubit>().removeFavorite(index),
                ),
              );
            },
          );
  }
}
