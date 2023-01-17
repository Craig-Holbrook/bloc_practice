import 'package:activities_repository/activities_repository.dart';
import 'package:bored_app/activities/activities.dart';
import 'package:bored_app/favorites/cubit/favorites_cubit.dart';
import 'package:bored_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required ActivitiesRepository activitiesRepository,
  }) : _activitiesRepository = activitiesRepository;

  final ActivitiesRepository _activitiesRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _activitiesRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (ctx) => ActivitiesCubit(
              ctx.read<ActivitiesRepository>(),
            ),
          ),
          BlocProvider(create: (_) => FavoritesCubit()),
        ],
        child: MaterialApp(
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
              color: Colors.white,
              elevation: 1,
            ),
            primarySwatch: Colors.red,
          ),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const ActivitiesPage(),
        ),
      ),
    );
  }
}
