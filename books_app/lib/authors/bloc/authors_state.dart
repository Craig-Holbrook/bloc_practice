part of 'authors_bloc.dart';

/// Enum for async request status
enum AuthorRequestStatus {
  /// Before request is triggered
  initial,

  /// After request is triggered but before it completes
  loading,

  /// Request completed successfully
  success,

  /// Request failed
  failure,
}

/// State class that manages the request status, list of authors,
/// and last query
class AuthorsState {
  ///constructor
  AuthorsState({
    required this.status,
    this.authors = const [],
    this.lastQuery = '',
  });

  /// request status for [AuthorsState]
  final AuthorRequestStatus status;

  /// list of Authors for [AuthorsState]
  final List<Author> authors;

  /// last query that was used to make a request for [AuthorsState]
  String lastQuery;

  @override
  String toString() => 'AuthorsState(status: $status, lastQuery: $lastQuery)';
}
