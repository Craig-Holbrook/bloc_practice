import 'package:bored_app/activities/activities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenerateActivities extends StatelessWidget {
  const GenerateActivities({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
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
                    if (success)
                      ActivityDesciption(activity: state.activity!)
                    else
                      Text('Generate your next activity!', style: textTheme.titleLarge),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () => context.read<ActivitiesCubit>().getActivity(),
                        child: const Text('Generate'),
                      ),
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
