import 'package:bored_app/app.dart';
import 'package:bored_app/app_router.dart';
import 'package:bored_app/simple_observer.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  Bloc.observer = SimpleObserver();
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}
