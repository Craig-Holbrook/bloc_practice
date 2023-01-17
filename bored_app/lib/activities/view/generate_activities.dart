import 'package:bored_app/activities/activities.dart';
import 'package:bored_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenerateActivities extends StatelessWidget {
  const GenerateActivities({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
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
                      Text(l10n.initialGenerateString, style: textTheme.titleLarge),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () => context.read<ActivitiesCubit>().getActivity(),
                        child: Text(l10n.generateButtonTitle),
                      ),
                    )
                  ],
                );
              } else {
                return Text(l10n.generateErrorMsgFeedback);
              }
            },
          ),
        ),
      ],
    );
  }
}
