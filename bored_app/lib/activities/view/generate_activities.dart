import 'package:bored_app/favorites/cubit/favorites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:bored_app/activities/cubit/activities_cubit.dart';
import 'package:bored_app/activities/view/activity_description.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenerateActivities extends StatelessWidget {
  const GenerateActivities({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: BlocBuilder<ActivitiesCubit, ActivitiesState>(
            builder: (context, state) {
              if (state.status == ActivityRequestStatus.loading) {
                return const CircularProgressIndicator();
              } else if (state.status == ActivityRequestStatus.initial ||
                  state.status == ActivityRequestStatus.successful) {
                final success = state.status == ActivityRequestStatus.successful;
                return Column(
                  children: <Widget>[
                    success
                        ? ActivityDesciption(activity: state.activity!)
                        : Text('Generate your next activity!', style: textTheme.headline5),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ElevatedButton(
                            onPressed: () => context.read<ActivitiesCubit>().getActivity(),
                            child: const Text('Generate')),
                        if (success)
                          FloatingActionButton(
                            mini: true,
                            backgroundColor: Colors.red,
                            onPressed: () {
                              context.read<FavoritesCubit>().addFavorite(state.activity!);
                              context.read<ActivitiesCubit>().reset();
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Added to favorites')));
                            },
                            child: const Icon(
                              Icons.favorite,
                              size: 20,
                            ),
                          )
                      ],
                    )
                  ],
                );
              } else {
                return const Text('Some error message feedback');
              }
            },
          ),
        ),
      ],
    );
  }
}
