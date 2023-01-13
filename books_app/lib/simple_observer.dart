import 'package:bloc/bloc.dart';
import 'package:books_app/authors/bloc/authors_bloc.dart';

class SimpleObserver extends BlocObserver {
  @override
  // ignore: strict_raw_type
  void onEvent(Bloc bloc, Object? event) {
    if (event is AuthorQueryTextChanged) {
      // print(event.query);
    }
    super.onEvent(bloc, event);
  }
}
