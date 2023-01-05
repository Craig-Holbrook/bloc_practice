part of 'authors_bloc.dart';

@immutable
abstract class AuthorsEvent {}

class AuthorQueryTextChanged extends AuthorsEvent {
  final String query;
  AuthorQueryTextChanged({required this.query});
}
