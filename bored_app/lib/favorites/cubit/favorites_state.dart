part of 'favorites_cubit.dart';

class FavoritesState {
  final List<Activity> favorites;

  FavoritesState({this.favorites = const []});

  @override
  String toString() => 'FavoritesState(favorites: $favorites)';
}
