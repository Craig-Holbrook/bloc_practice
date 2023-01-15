part of 'favorites_cubit.dart';

class FavoritesState {
  FavoritesState({this.favorites = const []});

  final List<Activity> favorites;

  @override
  String toString() => 'FavoritesState(favorites: $favorites)';
}
