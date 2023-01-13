// ignore_for_file: lines_longer_than_80_chars

import 'package:bloc/bloc.dart';
import 'package:books_app/authors/models/models.dart';
import 'package:books_app/authors/repositories/author_repository.dart';
import 'package:meta/meta.dart';
import 'package:stream_transform/stream_transform.dart';

part 'authors_event.dart';
part 'authors_state.dart';

/// debounce duration
const duration = Duration(milliseconds: 1000);

/// Debounce the events that get added on query change
EventTransformer<E> debounce<E>(Duration duration) {
  return (events, mapper) => events.debounce(duration).asyncExpand(mapper);
}

///Bloc that manages our search UI
class AuthorsBloc extends Bloc<AuthorsEvent, AuthorsState> {
  /// constructor
  AuthorsBloc({required AuthorRepository authorRepository})
      : _authorRepository = authorRepository,
        super(AuthorsState(status: AuthorRequestStatus.initial)) {
    on<AuthorQueryTextChanged>(_onQueryChanged, transformer: debounce(duration));
  }

  final AuthorRepository _authorRepository;

  /// Function to handle the AuthorQueryTextChanged event and emit new state
  Future<void> _onQueryChanged(AuthorQueryTextChanged event, Emitter<AuthorsState> emit) async {
    if (event.query == state.lastQuery) return;
    emit(AuthorsState(status: AuthorRequestStatus.loading, lastQuery: event.query));
    if (event.query == '') {
      emit(AuthorsState(status: AuthorRequestStatus.initial));
      return;
    }
    try {
      final authors = await _authorRepository.getAuthors(event.query);

      emit(
        AuthorsState(
          status: AuthorRequestStatus.success,
          authors: authors,
          lastQuery: event.query,
        ),
      );
    } catch (e) {
      // ignore: avoid_print
      print(e);
      emit(AuthorsState(status: AuthorRequestStatus.failure));
    }
  }
}
