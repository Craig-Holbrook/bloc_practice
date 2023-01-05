import 'package:bloc/bloc.dart';

class SimpleObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    // ignore: avoid_print
    print('bloc : ${bloc.runtimeType} change: $change');
    super.onChange(bloc, change);
  }
}
