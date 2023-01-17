import 'package:activities_repository/activities_repository.dart';
import 'package:bored_app/activities/activities.dart';
import 'package:bored_app/favorites/favorites.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivityDesciption extends StatelessWidget {
  const ActivityDesciption({super.key, required this.activity});
  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            title: Text(activity.name),
            subtitle: Text('${activity.type} — ${activity.participants} participant(s).'),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 10),
            child: IconButton(
              splashRadius: 15,
              constraints: const BoxConstraints(maxHeight: 36),
              icon: const Icon(Icons.favorite_border_outlined),
              onPressed: () {
                context.read<FavoritesCubit>().addFavorite(activity);
                context.read<ActivitiesCubit>().reset();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Added to favorites'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
