import 'package:bloc/bloc.dart';
import 'package:books_app/authors/models/models.dart';
import 'package:books_app/authors/repositories/author_repository.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:meta/meta.dart';

part 'authors_event.dart';
part 'authors_state.dart';

const duration = Duration(milliseconds: 1000);

EventTransformer<E> debounce<E>(Duration duration) {
  return (events, mapper) => events.debounce(duration).asyncExpand(mapper);
}

class AuthorsBloc extends Bloc<AuthorsEvent, AuthorsState> {
  final AuthorRepository _authorRepository;
  AuthorsBloc({required AuthorRepository authorRepository})
      : _authorRepository = authorRepository,
        super(AuthorsState(status: AuthorRequestStatus.initial)) {
    on<AuthorQueryTextChanged>(_onQueryChanged, transformer: debounce(duration));
  }

  void _onQueryChanged(AuthorQueryTextChanged event, Emitter<AuthorsState> emit) async {
    if (event.query == state.lastQuery) return;
    emit(AuthorsState(status: AuthorRequestStatus.loading, lastQuery: event.query));
    if (event.query == '') {
      emit(AuthorsState(status: AuthorRequestStatus.initial));
      return;
    }
    try {
      final authors = await _authorRepository.getAuthors(event.query);

      emit(AuthorsState(
          status: AuthorRequestStatus.success, authors: authors, lastQuery: event.query));
    } catch (e) {
      // ignore: avoid_print
      print(e);
      emit(AuthorsState(status: AuthorRequestStatus.failure));
    }
  }
}
