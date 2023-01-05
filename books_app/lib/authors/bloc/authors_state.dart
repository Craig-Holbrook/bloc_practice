// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'authors_bloc.dart';

enum AuthorRequestStatus { initial, loading, success, failure }

class AuthorsState {
  final AuthorRequestStatus status;
  final List<Author> authors;
  String lastQuery;

  AuthorsState({
    required this.status,
    this.authors = const [],
    this.lastQuery = '',
  });

  @override
  String toString() => 'AuthorsState(status: $status, lastQuery: $lastQuery)';
}
