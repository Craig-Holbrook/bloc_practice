part of 'authors_bloc.dart';

/// Abstract class for Author Events
@immutable
abstract class AuthorsEvent {}

/// Event that gets added when query text is changed
class AuthorQueryTextChanged extends AuthorsEvent {
  /// constructor
  AuthorQueryTextChanged({required this.query});

  /// query text for [AuthorQueryTextChanged]
  final String query;
}
