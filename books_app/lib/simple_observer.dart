import 'package:bloc/bloc.dart';
import 'package:books_app/authors/bloc/authors_bloc.dart';

class SimpleObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    // ignore: avoid_print
    // print('bloc ${bloc.runtimeType}, change: $change');
    super.onChange(bloc, change);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    if (event is AuthorQueryTextChanged) {
      // print(event.query);
    }
    super.onEvent(bloc, event);
  }
}
